#charset utf8

constant yml = #"
---
not-date: !!str 2002-04-28
explicit-int: !!int 12
explicit-float: !!float 12.12
picture: !!binary |
 R0lGODlhDAAMAIQAAP//9/X
 17unp5WZmZgAAAOfn515eXv
 Pz7Y6OjuDg4J+fn5OTk6enp
 56enmleECcgggoBADs=
application specific tag: !something |
 The semantics of the tag
 above may be different for
 different documents.
";

int main(int argc, array(string) argv)
{
  Parser.Yaml.Parser p = Parser.Yaml.Parser();
  p->set_input_string(yml);
  p->add_tag_callback("!something",
    lambda (Parser.Yaml.EventData e) {
      werror("Got callback for !something\n");
      return reverse(e->value);
    });

  mixed data = p->deconstruct();

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
