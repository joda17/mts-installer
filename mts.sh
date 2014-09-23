#/bin/sh

TIME = $(date +"%m-%d-%Y-%T")

mkdir -p /var/mt
mkdir -p /var/mt/minetest
mkdir -p /var/mt/build

if test -f "/var/mt/minetest/bin/minetestserver"; then
        /var/mt/minetest/bin/minetestserver
else
        cd /var/mt/
        wget https://github.com/minetest/minetest/tarball/master -O master.tar.gz
        tar xf master.tar.gz
        /var/mt/minetest-minetest-*/ /var/mt/build/
        cd /var/mt/build/games
        wget https://github.com/minetest/minetest_game/tarball/master -O minetest_game.tar.gz
        tar xf minetest_game.tar.gz
        mv /var/mt/build/games/minetest-minetest_game-*/ /var/mt/build/games/minetest_game/
        cd ../
        cmake . -DRUN_IN_PLACE=1
        make -j2
        if test -d "/var/mt/minetest/"; then
                mv /var/mt/minetes/ /var/mt/mt-copy/
                mkdir -p /var/mt/minetest
                mv /var/mt/mt-copy/ /var/mt/minetest/copy-${TIME}/
        fi
        cp -R /var/mt/build/* /var/mt/minetest
fi
