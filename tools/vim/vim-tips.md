���gvim����Gtk-WARNING **: Invalid input string
ͬʱ����gvim�Ĳ˵�����ʾ�쳣һ����
��������������Ե����ò���ȷ����ģ���������ܼ򵥣�

1. �� cd /usr/share/vim/vim73/lang������������Ϣ��Ŀ¼��

2. ����һ������ sudo ln -s menu_zh_cn.utf-8.vim menu_zh_cn.utf8.vim��OK����������

�����װ��
    һ��ֱ�Ӹ��ǵ�vimfiles��
    Ȼ����vimrc���޸�һЩ������������ʹ��

Excuberant ctags:
    �����ذ�װctags��Ȼ�����û������������߽�ctags���Ƶ�vim73�ļ����£�����ֱ�����ն�����ctags
    ����ÿ��Դ�빤�̣���Ҫ����tags�ļ�����cmd�£��ڸ�Ŀ¼��������ctags -R����
    ���vimrc��
        set tags=tags;
        set autochdir
    ��һ��������vim�ڵ�ǰĿ¼��tags�ļ���û�ҵ�����ݹ鸸Ŀ¼
    �ڶ���������vim�޸ĵ�ǰĿ¼���ֺűز�����
    ������<C-]>
    ������<C-t>or<C-o>
    �ֲ�����gd

Vundle:
    ����Vundle������$HOME/.vim/bundle/vundle
    ���ú�git
    ����vimrc
    �Ժ�װ�����ֻҪ:BundleSearch��Ȼ��Bundle �������������vimrc����

taglist:
    һ�㰲װ��������
    ����F3������Taglist����
    map <F3>:TlistToggle<cr>

pydiction:
    һ��vim�ļ���һ��complete-dict�ļ� 
    vimrc���ã�
        filetype plugin on
        let g:pydiction_location='F:\Vim\complete-dict'
        
