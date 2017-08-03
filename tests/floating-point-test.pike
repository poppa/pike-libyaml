#charset utf8

constant yml = #"
---
canonical: 1.23015e+3
exponential: 12.3015e+02
sexagesimal: 20:30.15
fixed: 1_230.15
negative infinity: -.inf
not a number: .NaN
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.Yaml.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
