package main

import (
	"errors"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/url"
	"os"
	"path"
	"strconv"
	"strings"
	"text/template"
)

var (
	_accessToken = os.Getenv("TELEGRAM_TOKEN")
	_chatID      = must(strconv.Atoi(os.Getenv("TELEGRAM_CHAT_ID")))
)

func must[A any](a A, _ error) A {
	return a
}

func run() error {
	homeDir, err := os.UserHomeDir()
	if err != nil {
		return err
	}

	file, err := os.OpenFile(path.Join(homeDir, "cron", ".errors"), os.O_RDWR, os.ModeType)
	if err != nil {
		if errors.Is(err, os.ErrNotExist) {
			return nil
		}
		return err
	}
	defer file.Close()

	content, err := io.ReadAll(file)
	if err != nil {
		return err
	}

	type TaskLog struct {
		TaskName string
		LogLines []string
	}
	var logs []TaskLog
	for _, line := range strings.Split(string(content), "\n") {
		parts := strings.SplitN(line, " ", 2)
		if len(parts) < 2 || parts[1] == "" {
			continue
		}
		taskName, result := parts[0], parts[1]
		resultLines := strings.Split(result, "`")
		logs = append(logs, TaskLog{
			TaskName: taskName,
			LogLines: resultLines,
		})
	}

	var message strings.Builder
	tmpl, err := template.New("???").Parse(`{{range .}}<pre>{{.TaskName}}</pre>
{{range .LogLines}}{{.}}
{{end}}
{{end}}
`)
	if err != nil {
		return err
	}

	tmpl.Execute(&message, logs)
	if message.String() == "" {
		return nil
	}

	resp, err := http.Get(fmt.Sprintf("https://api.telegram.org/%s/sendMessage?parse_mode=HTML&chat_id=%d&text=%s", _accessToken, _chatID, url.QueryEscape(message.String())))
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	if _, err := io.ReadAll(resp.Body); err != nil {
		return err
	}

	return file.Truncate(0)
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err.Error())
	}
}
