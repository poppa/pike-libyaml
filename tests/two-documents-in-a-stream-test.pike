
constant yml = #"
--- # Ranking of 1998 home runs
- Mark McGwire
- Sammy Sosa
- Ken Griffey
--- # Team ranking
- Chicago Cubs
- St Louis Cardinals
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
