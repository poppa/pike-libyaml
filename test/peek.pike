import Parser.YAML;

string yml = #"
array:
  - one
  - two
  - three
bool: true
";

int main(int argc, array(string) argv)
{
  Parser p = Parser();
  p->set_input_string(yml);

  while (int t = p->parse()) {
    werror("t: %s\n", describe_event(t));

    if (t == DOCUMENT_START_EVENT) {
      mapping next = p->peek_event();
      werror("Next: %O\n", describe_event(next));
      next = p->peek_event();
      werror("Next next: %O\n", describe_event(next));
      next = p->peek_event();
      werror("Next next next: %O\n", describe_event(next));
      // p->parse();
      // p->parse();
    }
  }

  return 0;
}
