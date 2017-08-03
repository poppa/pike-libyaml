# pike-libyaml
Pike wrapper for libyaml

## Installation

This module requires `libyaml` to compile. When/if that's installed just run

    pike -x module
    sudo pike -x module install

## Usage

```pike
mixed data = Parser.YAML.decode_file("path/to/file.yml");
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

mapping data = Parser.YAML.decode(yml);

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

You can also add tag callbacks for application (or generic) tags.

```pike
string yml = #"
  key: !to-upper |
    This string will be converted
    to upper case.
  ";

mapping data = Parser.YAML.decode(yml, ([
  "!to-upper" : lambda (Parser.YAML.EventData e) {
    return upper_case(e->value);
  }
]));  

([ /* 1 element */
  "key": "THIS STRING WILL BE CONVERTED\n"
    "TO UPPER CASE"
])
```

At the moment the Emitter isn't implemented.

