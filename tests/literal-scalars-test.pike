
constant yml = #"
--- | # ASCII art
  \\//||\\/||
  // ||  ||__
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%s\n", data);

  return 0;
}
