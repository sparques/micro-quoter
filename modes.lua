-- you can add more quoting modes in this table
modes = {
  -- default quote pairs
  default = {
    {"\"","\""},
    {"'","'"},
    {"(",")"},
    {"{","}"},
    {"[","]"},
    {"<",">"},
    {"`","`"}
  },
  -- extend "default" by allowing to easily introduce /* block comments */
  c_style = {
    {"\"","\""},
    {"'","'"},
    {"(",")"},
    {"{","}"},
    {"[","]"},
    {"<",">"},
    {"`","`"},
    {"/","/"},
    {"*","*"},
  },
  -- use `' for quoting text and $ for math mode
  tex = {
    {"\"","\""},
    {"'","'"},
    {"(",")"},
    {"{","}"},
    {"[","]"},
    {"<",">"},
    {"`","'"},
    {"$","$"},
  },
  -- if you have any quoting suggestions, suggest them :)
}
