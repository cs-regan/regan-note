### Intent

封装一个对象的构造过程，并允许按步骤构造。

### Class Diagram

![img](https://cs-notes-1256109796.cos.ap-guangzhou.myqcloud.com/db5e376d-0b3e-490e-a43a-3231914b6668.png)



### Implementation

以下是一个简易的 StringBuilder 实现，参考了 JDK 1.8 源码。

```java
public class AbstractStringBuilder {
    protected char[] value;

    protected int count;

    public AbstractStringBuilder(int capacity) {
        count = 0;
        value = new char[capacity];
    }

    public AbstractStringBuilder append(char c) {
        ensureCapacityInternal(count + 1);
        value[count++] = c;
        return this;
    }

    private void ensureCapacityInternal(int minimumCapacity) {
        // overflow-conscious code
        if (minimumCapacity - value.length > 0)
            expandCapacity(minimumCapacity);
    }

    void expandCapacity(int minimumCapacity) {
        int newCapacity = value.length * 2 + 2;
        if (newCapacity - minimumCapacity < 0)
            newCapacity = minimumCapacity;
        if (newCapacity < 0) {
            if (minimumCapacity < 0) // overflow
                throw new OutOfMemoryError();
            newCapacity = Integer.MAX_VALUE;
        }
        value = Arrays.copyOf(value, newCapacity);
    }
}
public class StringBuilder extends AbstractStringBuilder {
    public StringBuilder() {
        super(16);
    }

    @Override
    public String toString() {
        // Create a copy, don't share the array
        return new String(value, 0, count);
    }
}
public class Client {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        final int count = 26;
        for (int i = 0; i < count; i++) {
            sb.append((char) ('a' + i));
        }
        System.out.println(sb.toString());
    }
}
abcdefghijklmnopqrstuvwxyz
```





##### 定义

生成器模式(Builder Pattern)：也叫**建造者模式**，它将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。

具体就是：有些对象的创建流程是一样的，但是因为自身特性的不同，所以在创建他们的时候需要**将创建过程和特性的定制分离**开来。

##### 适用场景

当创建复杂对象的算法应该独立于该对象的组成部分以及它们的装配方式时，比较适合使用生成器模式。

一些复杂的对象，它们拥有多个组成部分（如汽车，它包括车轮、方向盘、发送机等各种部件）。而对于大多数用户而言，无须知道这些部件的装配细节，也几乎不会使用单独某个部件，而是使用一辆完整的汽车。而且这些部分的创建顺序是固定的，或者是需要指定的。

在这种情况下可以通过生成器模式对其进行设计与描述，生成器模式可以将部件和其组装过程分开，一步一步创建一个复杂的对象。



![img](https:////upload-images.jianshu.io/upload_images/1294138-a0340e5bf037727b?imageMogr2/auto-orient/strip|imageView2/2/w/1080/format/webp)

image



![img](https:////upload-images.jianshu.io/upload_images/1294138-ee07a801ee80db08?imageMogr2/auto-orient/strip|imageView2/2/w/1073/format/webp)

image

###### 优点

客户端不必知道产品内部组成的细节，将产品本身与产品的创建过程解耦，使得相同的创建过程可以创建不同的产品对象。

每一个具体建造者都相对独立，而与其他的具体建造者无关，因此可以很方便地替换具体建造者或增加新的具体建造者， 用户使用不同的具体建造者即可得到不同的产品对象 。

增加新的具体建造者无须修改原有类库的代码，指挥者类针对抽象建造者类编程，系统扩展方便，符合“开闭原则”。

可以更加精细地控制产品的创建过程 。将复杂产品的创建步骤分解在不同的方法中，使得创建过程更加清晰，也更方便使用程序来控制创建过程。

###### 缺点

建造者模式所创建的产品一般具有较多的共同点，其组成部分相似，如果产品之间的差异性很大，则不适合使用建造者模式，因此其使用范围受到一定的限制。

如果产品的内部变化复杂，可能会导致需要定义很多具体建造者类来实现这种变化，导致系统变得很庞大。



作者：MrSYLong
链接：https://www.jianshu.com/p/be46c2936c51
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

[Tag]: <tag>设计模式</tag>