#charset utf8

constant yml = #"
--- !!omap
# ordered maps are represented as
# a sequence of mappings, with
# each mapping having one key
- Mark McGwire: 65
- Sammy Sosa: 63
- Ken Griffy: 58
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
