# light-hugo

This a responsive hugo theme using [normalize.css](https://github.com/necolas/normalize.css/) ([sass](https://github.com/JohnAlbin/normalize-scss)). It is material in nature and very bare boned.
No javascript is used. Just straight up HTML and CSS.

## Page support

There is support for the following types...

* Posts
* Pages

The posts will be treated as blogs and pages will be treated with a similar fashion. There is a GitHub css theme used for the markdown generated for posts and pages from [markdown styles](https://github.com/mixu/markdown-styles).

## Config
The following config options are available for displaying custom content...

```toml
title = "Tony Blyler"

[Params]
description = "Programmer, deal with it"
logo = "/images/logo.png"
email = "tblyler@example.com"
github = "tblyler"
facebook = "example"
twitter = "tonyblyler"
linkedin = "tblyler"
```

You can also append your own `<head>` and footer elements (just before the `</body>`).
Do so by creating `layouts/partials/foot.html` and `layouts/partials/head.html` files in your hugo directory before compilation.
