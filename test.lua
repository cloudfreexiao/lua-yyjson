local yyjson = require("yyjson")

do
    local double = 2 ^ 53
    print(yyjson.encode(double))
    assert(yyjson.encode(double)=="9007199254740992")
    assert(yyjson.decode(yyjson.encode(double))==double)
end

do
    local t1 = {}
    t1[4] = "d"
    t1[2] = "b"
    t1[3] = "c"
    t1[1] = "a"
    local str = yyjson.encode(t1) --["a","b","c","d"]
    print(str)
    assert(string.sub(str,1,1)=="[")
    local t2 = yyjson.decode(str)
    assert(#t2==4)
    assert(t2[1]=="a")
    assert(t2[2]=="b")
    assert(t2[3]=="c")
    assert(t2[4]=="d")
end

do
    local t1 = {[4] = "d", [2]="b", [3]="c", [1]="a"}
    local str = yyjson.encode(t1) --["a","b","c","d"]
    print(str)
    assert(string.sub(str,1,1)=="[")
    local t2 = yyjson.decode(str)
    assert(#t2==4)
    assert(t2[1]=="a")
    assert(t2[2]=="b")
    assert(t2[3]=="c")
    assert(t2[4]=="d")
end

do
    local t1 = {}
    table.insert(t1,"a")
    table.insert(t1,"b")
    table.insert(t1,"c")
    table.insert(t1,"d")
    local str = yyjson.encode(t1) --["a","b","c","d"]
    print(str)
    assert(string.sub(str,1,1)=="[")
    local t2 = yyjson.decode(str)
    assert(#t2==4)
    assert(t2[1]=="a")
    assert(t2[2]=="b")
    assert(t2[3]=="c")
    assert(t2[4]=="d")
end

do
    local t1 = {"a","b","c","d"}
    local str = yyjson.encode(t1) --["a","b","c","d"]
    print(str)
    assert(string.sub(str,1,1)=="[")
    local t2 = yyjson.decode(str)
    assert(#t2==4)
    assert(t2[1]=="a")
    assert(t2[2]=="b")
    assert(t2[3]=="c")
    assert(t2[4]=="d")
end

do
    local t1 = {"a","b",[5]="c","d", e={
        w = 1,
        x = 2
    }}
    local str = yyjson.encode(t1) --{"1":"a","2":"b","3":"d","5":"c"}
    print(str)
    assert(string.sub(str,1,1)=="{")
    local t2 = yyjson.decode(str)
    assert(t2[1]=="a")
    assert(t2[2]=="b")
    assert(t2[5]=="c")
    assert(t2[3]=="d")
end

do
    local t1 = {[1] = "a", [2] = "b",[100] = "c",}
    local str = yyjson.encode(t1) --{"1":"a","2":"b","100":"c"}
    print(str)
    assert(string.sub(str,1,1)=="{")
    local t2 = yyjson.decode(str)
    assert(t2[1]=="a")
    assert(t2[2]=="b")
    assert(t2[100]=="c")
end