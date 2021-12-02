##

# OpenVINO
export OPENVINO=openvino_2021

if test -f /opt/intel/$OPENVINO/bin/setupvars.sh; then
    source /opt/intel/$OPENVINO/bin/setupvars.sh > /dev/null && PS1="OpenVINO: $PS1"
fi

# OpenCV
if test -d /opt/intel/openvino_2021/opencv/lib/cmake/opencv4; then
    export OpenCV_DIR=/opt/intel/openvino_2021/opencv/lib/cmake/opencv4
fi
#
if test -d /opt/intel/openvino_2021/opencv/lib/python3.8/dist-packages/cv2; then
    if test "$PYTHONPATH" = ""; then
	export PYTHONPATH=/opt/intel/openvino_2021/opencv/lib/python3.8/dist-packages
    else
	export PYTHONPATH=$PYTHONPATH:/opt/intel/openvino_2021/opencv/lib/python3.8/dist-packages
    fi
fi

##
