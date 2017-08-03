
constant yml = #"
--- >
  Mark McGwire's
  year was crippled
  by a knee injury.
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.Yaml.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%s\n", data);

  return 0;
}
