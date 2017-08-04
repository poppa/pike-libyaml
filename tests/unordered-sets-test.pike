#charset utf8

constant yml = #"
--- !!set
# sets are represented as a
# mapping where each key is
# associated with the empty string
? Mark McGwire
? Sammy Sosa
? Ken Griff
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
