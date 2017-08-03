
constant yml = #"
Mark McGwire: {hr: 65, avg: 0.278}
Sammy Sosa: {
    hr: 63,
    avg: 0.288
  }
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
