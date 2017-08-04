
constant yml = #"
---
!!pike tmtlMOFmYWhmYuB/qOhmYwYGSGVsbG8gUGlrZQ==
";

int main(int argc, array(string) argv)
{
  mixed data = Parser.YAML.decode(yml);

  werror(">>> %s\n", basename(__FILE__));
  werror("%O\n", data);

  return 0;
}
