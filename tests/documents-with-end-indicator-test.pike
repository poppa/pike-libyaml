
constant yml = #"
---
time: 20:03:20
player: Sammy Sosa
action: strike (miss)
...
---
time: 20:03:47
player: Sammy Sosa
action: grand slam
...
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.Yaml.decode(yml);
  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
