#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�ܥ�  ���DX���/nޮ����    @ ���FC�@  2��h��M#C!�� �� ��j��  F�  �   I"2LFM�M2x�S�y�OS��Ч��8 �񏐴��D���؄dt�9Y@eiF�v��z�A����塷�� ��UՈT�VY0������]�4��E��i�sz[���\�g���V����Y��kǘ�`ovZ8}�<�q��}ɦt�V���~]y�fH���K�Q�`�6�嘑��vBL	��+�y�Ϧ��^H�]�?��u��m���� �ʶ@�]{�ڇ����Eǜ����Q��Y��?(}$YnN�T#_�Hv薉Z�7���t�IH�\FR"C	=$�ȶ�,�gh��w��yRa_n3�BE߿�ͧ�� }\�oѧ��G�Q�p��.y}�<t6R�2���߹�01z��<T;��$Kz4:A��#�q�D�-�t	���#&���?����V���jBt��*I����[d��w���r��<�VmV2�ׇu�66��U�9R���F*���g��F���t�࿝<	�C] v��X�jp4��i�;{���?�OF�!�_3��SD�|�R���+R�!�ZRa6	�z����!�"A�)���@�h�@�Ɋ�p
���}��*�)��	F�6"�/s �	�X��2f��U*��]�?ч�ܑ{f@׆-l`��� �B��H2ܢ�SW��C}VPɩ,/����w���zd�q���8b�by�X�KW��y�� ���Z���d0��,$��b�Y��D�.5]K�2�t'�$����]�	+�.�p�!;�KN