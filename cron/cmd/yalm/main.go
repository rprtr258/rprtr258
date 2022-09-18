package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strings"
)

const _url = "https://yandex.ru/lab/yalm"

func main() {
	if err := run(); err != nil {
		log.Fatal(err.Error())
	}
}

func run() error {
	resp, err := http.Get(_url)
	if err != nil {
		return err
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return err
	}

	if !strings.Contains(string(body), "Балабоба временно не работает") {
		fmt.Printf("%s status changed\n", _url)
		return nil
	}

	return nil
}
