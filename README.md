# DarkFace

ug2challenge: http://www.ug2challenge.org

DarkFace: https://flyywh.github.io/CVPRW2019LowLight

## Guidlines

Please check http://www.ug2challenge.org/rules19_t2.html

## EvalTools

https://hub.docker.com/r/scaffrey/eval_tools_ap

**Please note that the eval_tools is expected to work with octave, there might be bugs when running from MATLAB**

```
docker pull scaffrey/eval_tools_ap:dry_run
```

```
docker run --rm -it \
    -v /path/to/your/submission:/tools/data \
    -v /path/to/save/result:/tools/output \
    scaffrey/eval_tools_ap:dry_run YOUR_ALGORITHM_NAME ./data/gt/ /root/UG2/Sub_challenge2_1/output/userid/output/submission_#/
```

will lead to:

```
octave df_eval.m YOUR_ALGORITHM_NAME ./data/gt/ /root/UG2/Sub_challenge2_1/output/userid/output/submission_#/
# df_eval.m takes three args
# the first one is ALGORITHM_NAME (used in the plot)
# the second one is the folder which contains ground_truth
# the third one is the folder which contains your submission
# note that the locations here should be the paths inside the docker image

```

`/path/to/your/submission` should contain:
- a `file_list.txt`, downloaded from: `<Google Drive>`

`/path/to/save/result` will contain:
- output of eval_tools including your scores

## Acknowledgments

Code borrows heavily from the eval tools of WIDER FACE. Thanks for the sharing.

## Reference results on track2.2_test_sample

DSFD ap: 0.470909
Faster-RCNN ap: 0.114775
PyramidBox ap: 0.352745
SSH ap: 0.332407

