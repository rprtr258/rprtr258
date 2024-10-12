package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"strings"
)

const _url = "https://yandex.ru/lab/yalm"

func run() error {
	resp, err := http.Get(_url)
	if err != nil {
		return err
	}

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	if !strings.Contains(string(body), "Балабоба временно не работает") {
		fmt.Printf("%s status changed\n", _url)
		return nil
	}

	return nil
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err.Error())
	}
}
