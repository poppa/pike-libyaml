import Parser.YAML;

string yml = #"
%TAG ! tag:clarkevans.com,2002:
--- !shape
  # Use the ! handle for presenting
  # tag:clarkevans.com,2002:circle
- !circle
  center: &ORIGIN {x: 73, y: 129}
  radius: 7
  text: !!binary |
    This is unfolded
    text dude
- !line
  start: *ORIGIN
  finish: { x: 89, y: 102 }
- !label
  start: *ORIGIN
  color: 0xFFEEBB
  text: Pretty vector drawing.
-
  flow: [1, 2, 3]
";

int main(int argc, array(string) argv)
{
  Scanner s = Scanner();
  s->set_input_string(yml);

  while (int type = s->scan()) {
    werror("> %s\n", describe_token(type));
    if (type == FLOW_ENTRY_TOKEN) {
      TokenData t = s->get_token();
      werror(" ** Flow entry.\n");
      werror("    Next: %O\n", describe_token(s->peek_token()));
      werror("    Next->next: %O\n", describe_token(s->peek_token()));
    }

    // werror("m: %O = %d : %O\n", describe_token(type), type, t);
  }

  // werror("Token: %O\n", describe_token(11));

  return 0;
}
