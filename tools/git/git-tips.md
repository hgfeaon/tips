����һ��Զ�̵Ĳֿ⣬Ŀǰ������
    ����github.com�ϴ���һ���ֿ⣬Ȼ�󱾵ش���һ���ֿ�
    Ȼ��git remote origin git@github.com:yushugg/xx.git
    ���У�originΪĬ�ϵ�Զ�ֿ̲��shortname
    ���Ž�remote��pull������git pull origin master
    originΪĬ�ϵ�Զ�ֿ̲��shortname��masterΪ���صķ�֧
    ÿ�ε��ύ����Ϊgit add .;git commit -m "message";git push origin master���鿴Ŀǰ״̬��git status��

cloneһ��Զ�̵Ĳֿ⣺
    git clone xxx.git [�����Ѵ��ڵ�Ŀ¼��]

����ssh key��
    ssh-keygen -C "...@mail..." -t rsa��Ȼ����profile�м����µ�key
    ������ͨ�ԣ�ssh -T git@github.com

branch and checkout:
    �½�һ����֧��git branch [branch-name]
    ɾ��һ����֧��git branch -d [branch-name]
    �л���testing��֧��git checkout testing
    �ϲ���֧����master��֧�£�git merge [branch-name] ��branch�ϲ���master

ignore �ļ���
    .gitignore���������

�鿴�仯��diff��
    git diff (--cached)

�鿴��ʷ��log��
    git log (-p -2)

�Ƴ����޸��ļ���
    git rm xxx  git; mv file_from file_to
    git remote rename file_from file_to
    git remote rm paul

git config��
    git config --global user.name xxx
    git config --list
