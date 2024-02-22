// Класс счетчика
class Counter implements AutoCloseable {
    private int count;

    public void add() {
        count++;
    }

    public int getCount() {
        return count;
    }

    @Override
    public void close() throws Exception {
        if (count == 0) {
            throw new Exception("Счетчик не использовался или все еще открыт.");
        }
        // Здесь может быть код для "закрытия" ресурса, если это необходимо
    }
}