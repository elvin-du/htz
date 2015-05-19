package utils

import(
    "time"
    "fmt"
)

func DateYMD(t time.Time)string{
    return fmt.Sprintf("%4d-%2d-%2d",t.Year(),int(t.Month()),t.Day())
}
