git命令：
    git cmd option 远端（github上） 近端（local）
    (git remote add origin https://github.com/yushugg/xx.git remote代表github上的仓库
     git push origin master origin代表github上的仓库名，master为本地的分支
     git pull origin master
     git commit -m "xx yy")

创建一个远程的仓库：
    先在github.com上创建一个仓库
    然后本地clone下来git clone https://github.com/yushugg/xx.git
    其中，origin为默认的远程仓库的shortname
    每次的提交，分为git add .;git commit -m "message";git push origin master;查看目前状态：git status；

或者先本地创建，然后github remote端添加：
    mkdir xx
    git init
    ...write something...
    git add .
    git commit -m 'xx yy'
    git remote add origin https://github.com/yushugg/xx.git
    git push origin master

clone一个远程的仓库：
    git clone xxx.git [本地已存在的目录名]

创建ssh key：
    ssh-keygen -C "...@mail..." -t rsa，然后在profile中加入新的key
    测试连通性：ssh -T git@github.com

branch and checkout:
    新建一个分支：git branch [branch-name]
    删除一个分支：git branch -d [branch-name]
    切换到testing分支：git checkout testing
    合并分支：在master分支下，git merge [branch-name] 将branch合并到master

ignore 文件：
    .gitignore中添加内容

查看变化，diff：
    git diff (--cached)

查看历史，log：
    git log (-p -2)

移除和修改文件：
    git rm xxx  git; mv file_from file_to
    git remote rename file_from file_to
    git remote rm paul

git config：
    git config --global user.name xxx
    git config --list
