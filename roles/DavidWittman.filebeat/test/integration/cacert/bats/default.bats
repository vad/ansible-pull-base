#!/usr/bin/env bats

@test "filebeat binary is in path" {
    command -v filebeat
}

@test "/tmp/filebeat is in filebeat.yml config" {
    grep "file: {filename: filebeat, path: /tmp/filebeat}" /etc/filebeat/filebeat.yml
}

@test "filebeat is running" {
    service filebeat status
}

@test "ca certificate was created" {
    grep "BEGIN CERTIFICATE" /etc/filebeat/ca.crt
}
