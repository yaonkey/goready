package main

import (
	"io/ioutil"
	"os"
	"sync"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}

	homeDir, err := os.UserHomeDir()
	if err != nil {
		panic(err)
	}
	filesInHomeDir, err := ioutil.ReadDir(homeDir)
	if err != nil {
		panic(err)
	}
	var wg sync.WaitGroup
	wg.Add(len(filesInHomeDir))
	for _, file := range filesInHomeDir {
		go func(f os.FileInfo) {
			defer wg.Done()
		}(file)
	}
	wg.Wait()
}
