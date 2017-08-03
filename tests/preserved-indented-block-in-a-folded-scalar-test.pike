
constant yml = #"
---
>
 Sammy Sosa completed another
 fine season with great stats.

   63 Home Runs
   0.288 Batting Average

 What a year!
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%s\n", data);

  return 0;
}
