# css-builder

A simple wrapper around the sass library. css-builder will allow you to specify one or more source directories and one destination directory. The application will then compile all SASS/SCSS files in the source directories to CSS and place the resulting files in the destination directory.

### Options

```sh
# css-builder -h
CSS Builder
    -s dir, --source=dir             Source directory
    -d dir, --destination=dir        Destination directory
    -f format, --format=format       Output format
    -h, --help                       Show help
```

Allowed values for the `--format` parameters are _nested_, _expanded_, _compact_ and _compressed_.