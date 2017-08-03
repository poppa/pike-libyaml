
constant yml = #"
---
? - Detroit Tigers
  - Chicago cubs
:
  - 2001-07-23
? [ New York Yankees,
    Atlanta Braves ]
: [ 2001-07-02, 2001-08-12,
    2001-08-14 ]
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
