public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id : "com.githum.ibraheemmoosa.elementary-gtk-hello",
            flags : ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var button_hello = new Gtk.Button.with_label ("Click me!");
        button_hello.margin = 15;
        int random_number = (int)((new DateTime.now_utc()).to_unix() % 10000);
        button_hello.clicked.connect (() => {
            random_number = next_random_number(random_number);
            button_hello.label = "Your Random Number is " +
                        random_number.to_string() + "!";
            button_hello.sensitive = true;
        });
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 500;
        main_window.default_width = 500;
        main_window.title = "Hello World";
        main_window.add (button_hello);
        main_window.show_all ();
    }

    private static int next_random_number(int seed) {
        int squared = seed * seed;
        squared /= 100;
        return squared % 10000;
    }

    public static int main (string [] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}
