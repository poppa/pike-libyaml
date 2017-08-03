
constant yml = #"
---
hr:  65    # Home runs
avg: 0.278 # Batting average
rbi: 147   # Runs Batted In
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
