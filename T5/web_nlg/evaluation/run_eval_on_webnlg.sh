#! /bin/bash

PRED_FILE=$1
OUTPUT_FILE=$2
TEAMR=$3
EVAL=$4


cp $PRED_FILE /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/submissions/$TEAMR.txt

cd /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation

# BLEU
python evaluation.py $TEAMR $EVAL

. bleu_eval_3ref.sh

cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/bleu3ref-$TEAMR\_all-cat.txt > bleu_all.txt
# BLEU seen
cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/bleu3ref-$TEAMR\_old-cat.txt > bleu_seen.txt
# BLEU unseen
cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/bleu3ref-$TEAMR\_new-cat.txt > bleu_unseen.txt

cd /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation
# METEOR
. meteor_eval.sh 

cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/meteor-$TEAMR-all-cat.txt > meteor_all.txt
# METEOR seen
cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/meteor-$TEAMR-old-cat.txt > meteor_seen.txt
# METEOR unseen
cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/meteor-$TEAMR-new-cat.txt > meteor_unseen.txt


# TER
cd /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation
. ter_eval.sh 

echo "ALL:"; cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/ter3ref-$TEAMR-all-cat.txt > ter_all.txt
# TER seen
echo "SEEN:"; cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/ter3ref-$TEAMR-old-cat.txt > ter_seen.txt
# TER unseen
echo "UNSEEN:"; cat /content/drive/MyDrive/web_nlg/evaluation/webnlg-automatic-evaluation/eval/ter3ref-$TEAMR-new-cat.txt > ter_unseen.txt

python /content/drive/MyDrive/web_nlg/evaluation/print_scores_webnlg.py > $OUTPUT_FILE

