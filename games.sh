#!/data/data/com.termux/files/usr/bin/bash
# termux-games: This is a simple tools for played games in Termux App
# Use this tool wisely. It is forbidden to distribute, copy, modify,
# and/or trading is the tool.
#
# BSD 3-Clause License
#
# Copyright (c) 2022, Rangga Fajar Oktariansyah
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS AS IS
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
skip=95
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

lztmpdir=
trap 'res=$?
  test -n "$lztmpdir" && rm -fr "$lztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  lztmpdir=`mktemp -d "${TMPDIR}lztmpXXXXXXXXX"`
else
  lztmpdir=${TMPDIR}lztmp$$; mkdir $lztmpdir
fi || { (exit 127); exit 127; }

lztmp=$lztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lztmp" && rm -r "$lztmp";;
*/*) lztmp=$lztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzma -cd > "$lztmp"; then
  umask $umask
  chmod 700 "$lztmp"
  (sleep 5; rm -fr "$lztmpdir") 2>/dev/null &
  "$lztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
]   �������� �BF`�*�+��)��l
�!=�N�T/ԡ�Zi��f����J��jo�>��0o��d��$젺n�ot㬯�y�rq��L���U��Ă7�	�7�ۏ�+j��AO|1]I2Lv�:�o/�c��)E�Q�����߫���\\"�M�./@^?��{�6Buk�H���G�`"7����H�>�)�W(N���Q���7MNQ�}�n�Ȅ����x�	�B�#H���妰������'��J+�Ę�Тo��#Jde݈�G�yDw��\�G��W8�g#���3yi�P{=�t۸�_�t%���}U
e:�4�S�+�C�N���X$GL�Qe#ٙ�r�t���S�<���79I�����c����^��rż�Ք/����͏K�Fg��7��n"v���Yw��>^o[�>�xؤ�DI�"GE+/_�����Rc��O9nR���;�Z�_���aOxh����v7a�<�I�?��t�c;�]vI^'?�`�E��O������{V�����M/1Myf"���O�O2�����0_�°&��(F>�z���J��V�zq�5�G���7+��J�� �qp݁A���x���:~��r�k���ƽr��֦.ZWyX���G�}���
�U�P5����yZ^��]���Gq�4,Џ�t��\]�mX=c\E)����(�p����1M�s��g�N}�ݴ+'8wг
3�F�ka24<OkGe)4I|� ���B��
�������A�2-��+�ph�K�8���j�;	�7�Œ�HhKܤ�C�,����%��s�m~��\��(5��5u5�'V]e�y�2�u_�yMd��Bh�</���ӝ�M���O4e�Ol���4���6�U�=H�m�Ӳ���G�?��I@���	ɄeK��*<]��K�PPw�o&�r�X����/���m2M��i�?�K��3������u�Ts�+@,׌�y6����#�0��u�jB�7����uP}����"9�����OCD:���&������S<+��L7��A3��s�@�?C��.�?ٳ\Y|E�7���@�7Ae�N��Z��G���~!a6L��Jĵ�g�"��@�K&�o��#3��@>5T���k�OL} <��\*P�L�Rt�TҦ$=ə�2��=�&!��BG6t��B�9�鿱�p=�sEzдD�BSnS��B�w�����Һ.V���:�FW��H�=ʹ����
pp_��@�*����m��p��Q�ڹRw0o���/�vKba)^��?m�"�jZ�f�QһG�;�g�&��/�&�{#n6��k>?zIuG"�ֹ,{�q�#s�4�<�e�۲��["�:/���}�`��*T��m�t�]�<�s+�X,4�{����ZPˎ��$��;��9'=w$%͂L���w۽H�e�Ա�N@���d������B7��^b�C�&Q�0#��=���hU��HK ��ϻr�� ���;�r�7J���
�K�/p1�2C}nٖ;��t_E���}Y���xQ:�E���=\"UB�_N���*E�K]j��`$sX��`�El0�'Z�3����X���L�����Ni���٢�fG���z�z�C��
�����9Mv�bVRAD���#k��#5��`���+��j�~	5��Mf7(>�/jۿ���h*/�kK��-ׂ+x)�������k�G$�ۉ��+S�=[����4q�����K���0����Hj+<���'�I@7�4!�>����Md�{uƟ�Q�����r�?F�ɀ�3jhc�j�B}3U���JiU�zy�IƆG�|�5� ���$S�ϣ�)��o�J/����2�E)���ZG���o�����	,�-8���VUZQdۀ��s�yG�+��J�~�B�Z�\˗'@��u�h��C]!e����/T��75�/K�%k
�	�s�Y��!�6�>^6��^}h��`J`��(���`?2zE����9�҇����|�N��`/*]}����%��mxN�a�|��"$�1d��,���������J��q�2Xs��n���2��DZ`�A%6�f�fߟ��WO�V�(^$ꯒ��6x׫}[�f�Z�7����bh�2�|�I�.�����f��Ȉ"^��BW���R����?Z��ARTԐ����l������;���>T�� �� N��E��cE�M��W�o��FL	�:Rv�������+f"�DiS"0�+Ωw�P�O$�k�36C�]�)��蟮��uAR��E��kٴ�,��2��e+X���f�|�ù�������y�2-O�7}�ce��~�R�'��7���H3!����M�&+m�*�EDd?����'��p�]�ڞ�7Z_*-���#� �Y�W����g�FU�"EBvb�$�
?�9��ĕP�Yn��ؽN�%4{�"R��O�N�����0'|;�����k
*�T)�2)���|��b���S��bf<(�w���;��Ǹ���S��<& 7S��.g�^���y�0�ER5%Y
I�Ɲ��_��3�(��ӀɈ4�Gڞ��7�l�c�u�}���!����3�0/n?J]��r��T��>׮�F��u�pss�*�����G�y�[.��Q�9j1?�HC��uh�8�.YrDCw��C"�w=�(���:ϲC��I|��P�/������xx�&�Ff�id���IQ
¶�%���aě��n/���!?GXJ���[G
���f�H�6��8�~�>ts8���f}�T֖���'��@Uc�+���1 ���8�eC�ٖܯҎ&a�v;{�A,!t&5wzX�ת��O��^tٴ�>��ͦ�M3��R'��G��YE�+j�ΰ9ⷫ���sh��\P6�6�y�)HY��;iI��~4�F����Tf���Ф�d�����:w�'� ��Z�4IН#�GK&�~�� -.�_�/#T�Lq0����P.Sb4л�)��OF܁q��������^	�ɟP����tm����v�-���P^�6�7��OB�´'-!��~��w"=f���[ٙiDy��X�c�uCT�Ԟ�s��'�c:=pC"]�b���ַӠ�{20btT��-܁<��gx��ڼ���C}�N�ĭ}���u��n��ϬB5��;c����$1L��L�d��Fz��"(�%�Y	�%��_����5K₰��sv5�J����GH�/]{���0�R�Tm�[�kO�/�@g8��r@[$�[�/�}d�m���i��S�
�ɾ���ۀbp&�	 0��;~�>L�W7�W��J?ٵ���Lc>��X�a}�Xq{l��ɃT��,F@�i�� i�ՓYʋ#.W���XM�7E��_��T0r�v�~oY�N)��Бl�{�C)�vI��ڔ9��vi=He�~�+�Kݣ��
~��9��{�@�g�����Gg��{`n�~7����f�y>���������2�J@��Ű���ܓ����͑��#
��
��tN�����ģ�*S�����8�|�ڸ!+�_H����DS�Y�&R�uQ��%��5�Š�w���jmI?a�Ɠ�w`4��8Ů�[���chá��_�o�y�R3�5�;��~�nq@h)|^��\D�U�,�"�UY+�+�S�A���"�'&���U����Wb8�~��,X
EBAh����&M�]7�B�x���G�ڡ�m��r֝����r��l��a���ی�?��g-�0	E�aZ�D��p~"v�/�ZÓ�M�,!ղ�K�z��"�ZES*�q�%Ip�K1�Vj<��5w\c�,�;  C��u�G�W��W�yC\ 5�0��O�Ik�����D�6��8��wy��XX��g��"/�2>��[/�Œ�������˫k)a}������.�A�y���C�Z����E�Xnƫ0
as'�����#|���QO��rR$��3 �ܕ�쨕o����᪇&D�p��a��Ь,�%��V�q�����t��b���7XM�R�h��|e+xdx�DwA>\*�X�t��o\N^D�wq9��l���x��N�`���P���1���s4���O2b���3�Q�'�����`~w�B�3��2���jNR%�g�`\���~ʉm"�(:�T��:��N�^�a�W���)	M`f����p��$�;V�A���0��*F�!�yHU���� +���k1�5A���K�l�IW��_�f���m�)��������q?C��B�ߋ�Ϳ�L�{�D���Sf{-��]�-�N�^?$�չ������7Wҩ���c��^`�Xl�gZ���ϱ�'�C�{������fdxd�ʼ�M�����ä�Yp=
Qt$&K�_완��e�*$���I��v��D�2�l�Oy�8�!�ю�{�z�Aڡ��x[�3b�>��H�L�������OF�y!5��N/�+��a���[����-'=���52�����t{M�V��a���B���d�h�s�WJ�k�k��z�oS���2F��=�%�����r�X>KH��c�x+t#wV᙭'�z����uX<�l:��)���[�����}�Xﶵ��G;�	���cb�|j蜰
T���6��:[��ǅh�?a���ai�y����1���������a\��.�
<�K�mz�!�Nd/������@G��r�:� �ګCD;���X�0B_������/4�bD�z�S�ϫ�0܏5��%���"�	�?\>���D��������T ��LK�����T��.7�䳱u2X�R+�����=Y=S�~m���+��Zoeg�<?�O���?��������L���!~z�'j�LR
���,�)�Y(R���BZ�B�㓯]���"�->�:@�"��?�j�\?�y���6k���K{��W���4�Iq(���� ��V�I^��-	0��R�d�'����l�����$�&e_Wd�V�I�p8V�g����.j��y���V=��kԪ� �, aW�?�;tNZc)L�]��6c(�1X��[55�h2f���;T�1u����>I�}H3�����UJ�^6^�lsLV�^��#?,�iP�$X�8
���/3j4��b�ϊ�ov�	�R����7fp��CĤ�W�}�.���^0dev��h��!�:>������k��{`����� �8\2�dbK��`�����꼀�D�����p7�O������7�`�+F;"a� n�qd;���1�,oZ�N��ȱ�,W��C�H�9�K�����2+���ɧ<F\<��� �{eه8;��F�N8:_�&���f��>�aB:��gY��u��.G;qb=3GaJ=m��]qT�pn͟��Zk��^.���H��,}%be`�ݓA���#{=A��+<�ٴ�D5�ó��{5(P��9o{?��u�&���a�D+&jk�^���(�G� ��[�U�ңω$+r,���Ϣ�Ñ껾[�����2�/���ǥ�!ߩ#�G����ps��Q1{��D4��
@BT��t"�kf�����]�8��z���q-fg[8�#$ѩ�?��x��r��Bc��kY��Tu��qI^��GG^d�$0�U�?�z�Ķ����I5:?ze?̸O)E��ʫ��r"[��Xd�h��vB^�[^NL$�h�'��-���Vx������^y�<;�L�B��\�.b?^�~�1Of�AO�U�_�8R��@$�)����&@	���Z3��!� '�lHn�x[����ȣxŰ(��B�uEWOQo��@њb���P>g��A�U��B���6l�?�4:A��C�����mN��f!1����wg��X����o�+�w+���%P�YUH��ؠG��;�����UY������ۑ*N�Qw�$ږ���^��2\] ��0B� ���gmc�^��:L�x%+��֢y��	�T��FO�ٟ��__`8�9�~���sKqS:(;�,�Txa�A�L:����#ջh4�*hs^֫���a���7���e�L�%|w����lu�Q���1'�ף�b��ͯn�A��24�ƛ�����Oe=~=g�\2j8��3%]��Q��P�����Bvs��sסxi@�4d��f���A}�ֆ��Wxd�����`�B�N�@NK|?,�|��78i�3�f��'U�]["�̫��I�t�-2��H�+ƣqX�)��Џ��CR�������IW���T�5� /������kBf_�/O�����~W%d��ﾘ�}�v�c����W�wE�^��,�%,��m|��[Hj X(��kq�� ]w9턂 H�
�&�j�1�Y���,�_S<��6���?r�+.���T��B:6�Cs�	��y[
�,��d���\���
W�ᗖ�	���0�A��2�;��M`>0�x/E��J��]�Uf��cоK��`mn�|IG�$�*^q.�4��+Ƙ@�jV"G�
"�Qa������m٤��E��ޛaf�F�̝c��2��	�ڝw�P��Hxm=�!L�;c�&��:~?�<�;p>��-dY��#B�ҽ&��DC"%�{�m�xIR�6��!�V��^&z"�%{���6�y�	#|��N����"o��yf���Q�H�Xz]](^��S	a�	}�1�b�I�U�b��B~�����`40�yE�� �7���&s4�K5l5	l.���oߓE�u�NC=X�GUu��Y-f#VxQ=Pt� ˻3�����i�S딋u�y�	C��O|���o�(W��'2�-&��Q�	��h�`��Ԟ�ؑ9��|ٶp��@c�-;��TG�h=�:Ӧ����g�!B�U��Y��#�(!��N�������j�F�`Lc4sݖL�S��!���9��Nvb|���*5�5˛-i��� N4xF�>�2�P!����UǮ^��|1��Ixo%I}�K�N����*�&������k�R��K�e�`��@�JI�@ M/��B�kp��*n@*-�I��=����Ht�:�i�)ylK����A�7��ۛ���?���1����k5��8ŵDT�ӧ�;Q����w��FB��W�X��U�5���V�S�^Cʅ>^7�A���÷b�4��`����Y��p�U�YNx�N��)���(X�:on=�qN�G�c��~����Q$V�>��2�ly0�� 4R����ف��4�]�c>��u/�l��\vA��2�;tkiVj�.�}8�,8&��ꚩ���~�=�#�;��S����Z���s����C���=n"1�O��cUy$�+!OF���@= ��C�g-�jH�T"P�*��]��AsV�䡍��oG�����#n~�`��aoW����9XF_Λ�*�;�*�C��,�b��o��~���8�eA��S��$�(����́����O������<i�⧍��G'����|�:�e�;��ޭ'ّ�`Ӆ���i�x�8�����9Y��x�Cb��RFb�a#h��$.~P�ױU'���qo��Î����-�ס�2D-}1�s&�<5ﶼv[����w��ѵ� ��L>fBp�mb�dϯ�U�}��]pXy��b��8`���~d~:H��W�e�W�~o�F[��ߐG.��5(vÆ�w�m
���x�c,u�]	شi�����Y8�� b��s�MnY~�A(�	�<~ɏ�x�9xr﹣�m8�U����u���bKvᝣE�h\�G��w){�;
��)dA������,��q�4�U;Z 
����չ�rK��%a�h����j��{P�F�*VԞ��������,�RzD����o>�2�!��t�>u{��	���ѶJ��j� E�bv��ۏ�2r+�/�w��{u�DU� �+��k�;�n�ǉM���	�R��F�9_e3B5V +�q-�(��WM�"Q��~0١�Y�q�_�cM��V
��i�M�8�S�W�0�r0 Y��Ө�/_Z/]tuק�I������2� J�D�M���=��TZX���́��A�Η�+�-�iI�����Ziy\j�Eٮ�k��%@�<�\�XH��"�t���ϐ'���O���p3FG_������aA���!�ks4O''�Z0����p��W�����/�7T
�1^��!gcjJZs��C!��}�)�h�����#���(��biC�b�o�Q_�N�(d{���Ö=5>�i\��CȾݚF^�Qh4�#S�ĒZ` �μ��ң�q��$\{bp�,x�tn���qV�-����?�6�1s�T	jx�I龗�?u����D�h���<��i��>n�#�N/t��l�����(��b���[c)��ogNĴIѼ�Pv�Ұ�t�d0����R�'�� b'���:�^2m�+��ﳈ�o�Ѧ@��%S�J����g\�.K�}8 �� :w���7�L���6��-������v�U��$��k��1Pd����G$HiJ��@��M�|޳*��a)�ڳ��m�a�>[�3�u�]��]�w�晸�h�44f����ˮ��x�!R��ʔTh��sB�b�����YB��w�|!X>�[|,u֕W�4���$ݚ�-x̯����zK�.w�3f�}1�ҁ����d�	V�#�it�o���H�Ձ@���qsy" �� N�y�-%�5�*-_�	=7y�|�fM{�9�_W�ڡ�Uz�g��I��D&z�3q�V5�"8ۣ<��OM0�� �̶����g9H���P��kYV;ZK���y�L��C�U��Ɠ�l�%�x���s�=��b��G�]o��)Zҏg�Rh�9_l�P&g��'ҟߠ��E�Kg�A;;�aݛc�y��R�KN�d�_��e�(��5����%�ЯR��.����~K,���\J�vD�~5��H��3���C��^�d���w����o�1rT�Si{�0yV���KxL�B�����Dm8�*B�c��d!!�fQ�|��_Gפ�C�����򐯏x2��1S��HY\�:� ) jD+��+HP�0��'R�01J;�n���˻B�1��I�����n�R�gak�"�n�w��_���(�=<R=��4�ۀ�$4�'\��mUܨ��#L	��6�?)�I?dȴ�I��)1+E9�q�1 r?)�����U\��(1f.F�W�k�F��=���L4�,��sP>�0�\ �ͮ�-�U��3�3c��ūQ!8cҿ�G��t�(�4��xl�T�N'MĎ��`�!�M�{���	>it~%j���L_P�@��zE�� �c��p���<��R<g�bS��;�꣺�}��b�h>_��w��'^��Ԇ�K��	����9ܪ�{q%����l�?D,��
��G��%,�}A�0~��e�~+fB{����m�:���)�T��[-`�~�9�ފ��+�/�[�l���sk��4��#SA),%.zr���Vّ���b��5��4!���A<��i��f�U#��y
�$ؔ�E�xa���iȓ��u4W@Rn(�Rѱ+�"��!�0o�@ye��`r}x!O�n�X �� �`|�������:&
�A3��0���R�ϲ��i9Z�3��z�Q��T-�r����9���R1�S�w�'e� �6�S�TƎa�����@�,���yD$�89X(�D�#���"�WD�o�I`�E$�iM�eȣ��6��<���
<��81;/���g�3�O���W�b����%\�e����@ې���P����1��z�8`�j�N�6a�as�duL���z��:�*��ݬ�~j��rK�JB����^�-�h�L�
�{$��ju��R�󯝅�ӭ�q۟���p^Ⲏ����(n���ge��F�?xi�^SF)N���j�:��w	IhU�vb+!I�F�wF��T˯���Zݦ�M�H[a�;�P��\�d1�6�~9"3A��yP[s�dv�%t�-nn�pz7N��=J�l�X�bκ�ڌ7���l��`��^G��W 'T��A�B���S�;�9"�H-PZls�Y��ܵ�>���ʊ�}Wh�_�Zb��c��r�c__~dF�qQ(��%2��������0���>�l�qT���{���8��B�lw=N���թ�}2}�����v��Z[#�rJ��:)�Dj��J��X����G��/�I����@�%�����#�&�h�;�P�O(�����1���w0�w�W:�t���J2��w]�q0|>m.�E(*�V�{����I	lt���6H�zD%�Kmś�@$���v͏vuO�M��CV�é���jE3΢�v1w��em� q�g�CcsB"?�/hlI�rX}26^��1|نdQΝa0�����w������g,�/W��~�k]&�@T���ŕ��<:.�b��z��KYJL�T��T���M��Х�J��w�8牁�x:B�/�z��%�f��0j=M��c��n�vA���Hɾ�0��_�~;`N��~�71�8=��x+a�纞=�T��,�x��_�g8�HȍY�g�$[b�xh��t���ję��Z��$�B�R�Q<�0�{�W�f&1��ly?���A�ٍ �ช��C���d� 7	�C�����K�M��O��I�VoL�728n�A����S�$<�2����>�S-���
�Z�Z�'K7YUb�:��\���-��:�tN>�"��<U�	``F��ke�ڠs�U��$���m�8�B��h1��%��N$�?��LJ���w�{tQ:�b$���v