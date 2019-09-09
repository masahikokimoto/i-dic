#include <stdio.h>
#include <string.h>
#include <sj3lib.h>
#include <locale.h>
#include <jstrings.h>

main()
{
  int stat;
  char buf[256];
  char *yomi, *kanji, *code;

  setlocale(LC_ALL, "");
  if (stat = sj3_open(getenv("SJ3SERV"), getenv("USER"))) {
    fprintf(stderr, "can't open %s, cause:%02x\n", getenv("SJ3SERV"), stat);
    exit(1);
  }

  while (fgets(buf, sizeof(buf), stdin)) {
    yomi = jstrtok(buf, "\t");
    kanji = jstrtok(NULL, "\t");
    code = jstrtok(NULL, "\t");

    switch (stat = sj3_touroku(yomi, kanji, atoi(code))) {
    case 0:
    case SJ3_WORD_EXIST:
      break;
    default:
      fprintf(stderr, "%02x:'%s' '%s' %s\n", stat, yomi, kanji, code);
      break;
    }
  }
  sj3_close();
}
