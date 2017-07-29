/*
  This script parses yaml.h for enums and creates stubs for the corresponding
  Pike constants in Yaml.cmod.

    pike make-enums.pike > yaml_enums.tmp

  Then copy the content into Yaml.cmod
*/

constant YAML_H = "/usr/include/yaml.h";

int main(int argc, array(string) argv)
{
  if (!Stdio.exist(YAML_H)) {
    werror("Unable to find yaml.h (%s).\n", YAML_H);
    werror("Change YAML_H to your location manually.\n");
    return 1;
  }

  parse();

  return 0;
}


#define prev tokens_no_ws[i-1]
#define curr tokens_no_ws[i]
#define next tokens_no_ws[i+1]

#define MOVE_TO(WHAT)              \
  do {                             \
    while (++i < ntokens) {        \
      if (curr->text == WHAT) {    \
        i += 1;                    \
        break;                     \
      }                            \
    }                              \
  } while (0)

class Enum {
  string source;
  array(string) members = ({});

  void create(string source)
  {
    this::source = source;
  }

  void push(string s)
  {
    members += ({ s });
  }

  string to_def()
  {
    string s = sprintf("/* Constants from `%s` */\n\n", source[..<2]);

    foreach (sort(members), string m) {
      string pikename = m - "YAML_";
      string tmp = sprintf("/*! @decl constant %s */\n", pikename);
      tmp += sprintf("add_integer_constant (%q, %s, 0);\n",
                     pikename, m);

      if (sizeof(tmp) > 78) {
        tmp = sprintf("/*! @decl constant %s */\n", pikename);
        tmp += sprintf("add_integer_constant (%q,\n"
                       "                      %s, 0);\n",
                       pikename, m);
      }

      s += tmp;
    }

    return s;
  }

  string _sprintf(int t)
  {
    return sprintf("%O(%O)", object_program(this), source);
  }
}

class Tag {
  string name;
  string comment;

  void create(string name, string comment)
  {
    this::name = name;
    this::comment = comment;
  }

  string to_def()
  {
    string pikename = name - "YAML_";
    sscanf(comment, "/**%*[ ]%s*/", string c);
    c = String.trim_all_whites(c);
    string s = sprintf("/*! @decl constant %s\n *! %s\n*/\n",
                     pikename, replace(c, "@", "@@"));
    return s + sprintf("add_string_constant (%q, %s, 0);\n",
                       pikename, name);
  }

  string _sprintf(int t)
  {
    return sprintf("%O(%s)", object_program(this), name);
  }
}

void parse()
{
  string data = Stdio.read_file(YAML_H);
  array(Parser.C.Token) tokens = Parser.C.tokenize(Parser.C.split(data));
  array(Parser.C.Token) tokens_no_ws = Parser.C.hide_whitespaces(tokens);

  int ntokens = sizeof(tokens_no_ws);

  array(Enum) enums = ({});
  array(Tag) tags = ({});

  // Sentinels
  tokens_no_ws = ({ 0 }) + tokens_no_ws + ({ 0 });

  for (int i = 1; i < ntokens; i++) {
    if (curr->text == "enum") {
      string source = next->text;
      MOVE_TO("{");
      Enum e = Enum(source);

      for (; i < ntokens; i++) {
        if (curr->text == "}") {
          break;
        }

        if (curr->text == "," || has_prefix(curr->text, "/*")) {
          continue;
        }

        e->push(curr->text);
      }

      enums += ({ e });
    }
    else if (has_prefix(curr->text, "#define") &&
             has_value(curr->text, "_TAG"))
    {
      sscanf(curr->text, "#define%*[ ]%s ", string def);
      tags += ({ Tag(def, prev->text) });
    }
  }

  foreach (enums, Enum e) {
    write("%s\n", e->to_def());
  }

  foreach (tags, Tag tag) {
    write("%s\n", tag->to_def());
  }
}
