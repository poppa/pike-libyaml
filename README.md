# pike-libyaml
Pike wrapper for libyaml

## Installation

This module requires `libyaml` to compile. When/if that's installed just run

    pike -x module
    sudo pike -x module install

## Usage

```pike
mixed data = Parser.Yaml.decode_file("path/to/file.yml");
```

Or

```pike
string yml = #"
    name: John Doe
    age: 42
    retired: n
    languages:
      - Pike
      - Python
      - Rust
    ";

mapping data = Parser.Yaml.decode(yml);

([ /* 4 elements */
  "age": 42,
  "languages": ({ /* 3 elements */
        "Pike",
        "Python",
        "Rust"
    }),
  "name": "John Doe",
  "retired": Val.false
])
```

At the moment the Emitter isn't implemented.

