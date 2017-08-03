
constant yml = #"
---
- Mark McGwire
- Sammy Sosa
- Ken Griffey
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.Yaml.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
