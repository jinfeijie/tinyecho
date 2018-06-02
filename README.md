# tinyecho Test

### clone 

```
git clone https://github.com/jinfeijie/tinyecho.git
```

### move

* in tinyecho dir

```
cd .. 
mv tinyecho PHP_SRC_PATH/ext/
```

### init

```
cd PHP_SRC_PATH
rm configure
./buildconf --force
```

### make

```
./configure --prefix=/usr/local/php --enable-tinyecho
make
make install
```

then,you can run `php -m` see it
