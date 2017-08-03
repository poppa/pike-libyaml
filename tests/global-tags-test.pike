#charset utf8

import Parser.YAML;

constant MY_TAG_URI = "tag:clarkevans.com,2002:";

constant yml = #"
%TAG ! tag:clarkevans.com,2002:
--- !shape
  # Use the ! handle for presenting
  # tag:clarkevans.com,2002:circle
- !circle
  center: &ORIGIN {x: 73, y: 129}
  radius: 7
- !line
  start: *ORIGIN
  finish: { x: 89, y: 102 }
- !label
  start: *ORIGIN
  color: '0xFFEEBB'
  text: Pretty vector drawing.
";

int main(int argc, array(string) argv)
{
  mapping my_circle, my_line, my_label;

  mixed data = decode(yml, ([
    MY_TAG_URI + "circle" : lambda (EventData e, Parser p) {
      return my_circle = p->deconstruct_mapping();
    },
    MY_TAG_URI + "line" : lambda (EventData e, Parser p) {
      return my_line = p->deconstruct_mapping();
    },
    MY_TAG_URI + "label" : lambda (EventData e, Parser p) {
      return my_label = p->deconstruct_mapping();
    }
  ]));

  werror(">>> %s\n", basename(__FILE__));
  werror("All data: %O\n\n", data);

  werror("my_circle: %O\n\n", my_circle);
  werror("my_line: %O\n\n",   my_line);
  werror("my_label: %O\n",    my_label);


  return 0;
}
