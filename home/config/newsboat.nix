{ pkgs, ... }: {
  programs.newsboat = {
    enable = true;
    package = pkgs.newsboat;
    extraConfig = ''
      show-read-feeds yes
      auto-reload yes
      reload-threads 10
      bind-key j down
      bind-key k up
      bind-key j next articlelist
      bind-key k prev articlelist
      bind-key J next-feed articlelist
      bind-key K prev-feed articlelist
      bind-key G end
      bind-key g home
      bind-key d pagedown
      bind-key u pageup
      bind-key l open
      bind-key h quit
      bind-key a toggle-article-read
      bind-key n next-unread
      bind-key N prev-unread
      bind-key D pb-download
      bind-key U show-urls
      bind-key x pb-delete
      color listnormal cyan default
      color listfocus black yellow standout bold
      color listnormal_unread blue default
      color listfocus_unread yellow default bold
      color info red black bold
      color article white default bold
      highlight all "---.*---" yellow
      highlight feedlist ".*(0/0))" black
      highlight article "(^Feed:.*|^Title:.*|^Author:.*)" cyan default bold
      highlight article "(^Link:.*|^Date:.*)" default default
      highlight article "https?://[^ ]+" green default
      highlight article "^(Title):.*$" blue default
      highlight article "\\[[0-9][0-9]*\\]" magenta default bold
      highlight article "\\[image\\ [0-9]+\\]" green default bold
      highlight article "\\[embedded flash: [0-9][0-9]*\\]" green default bold
      highlight article ":.*\\(link\\)$" cyan default
      highlight article ":.*\\(image\\)$" blue default
      highlight article ":.*\\(embedded flash\\)$" magenta default
      browser w3m
      macro v set browser "mpv --ytdl-format='bestvideo[height<=1080]+bestaudio/best[height<=1080]' %u" ; open-in-browser ; set browser "w3m %u"
    '';
        urls = [
      { url = "http://static.fsf.org/fsforg/rss/news.xml"; title = "~FSF News"; }
      { url = "http://static.fsf.org/fsforg/rss/blogs.xml"; title = "~FSF Blogs"; }
      { url = "https://fsfe.org/news/news.en.rss"; title = "~FSFE News"; }
      { url = "https://planet.kde.org/global/atom.xml"; title = "~Planet KDE"; }
      { url = "https://pointieststick.com/feed/"; title = "~This Week on KDE"; }
      { url = "https://thisweek.gnome.org/index.xml"; title = "~This Week on GNOME"; }
      { url = "https://www.omgubuntu.co.uk/feed"; title = "~OMG!Ubuntu"; }
      { url = "https://www.omglinux.com/feed"; title = "~OMG!Linux"; }
      { url = "https://blog.thunderbird.net/feed/"; title = "~The Thunderbird Blog"; }
      { url = "https://thelinuxexp.com/feed.xml"; title = "~The Linux Experiment"; }
      { url = "https://itsfoss.com/rss/"; title = "~Its FOSS!"; }
      { url = "https://9to5linux.com/feed/atom"; title = "~9to5Linux"; }
      { url = "https://blog.elementary.io/feed.xml"; title = "~elementary OS Blog"; }
      { url = "https://blog.zorin.com/index.xml"; title = "~Zorin OS Blog"; }
      { url = "http://blog.linuxmint.com/?feed=rss2"; title = "~Linux Mint Blog"; }
      { url = "https://www.gamingonlinux.com/article_rss.php"; title = "~Gaming on linux"; }
      { url = "https://hackaday.com/blog/feed/"; title = "~Hackaday"; }
      { url = "https://www.phoronix.com/rss.php"; title = "~Phoronix"; }
      { url = "https://betanews.com/feed"; title = "~Betanews Linux"; }
      { url = "https://theevilskeleton.gitlab.io/feed.xml"; title = "~TheEvilSkeleton"; }
      { url = "https://tutanota.com/blog/feed.xml"; title = "~Tutanota Blogs"; }
      { url = "https://techcrunch.com/feed/"; title = "~TechCrunch"; }
      { url = "http://www.techradar.com/rss"; title = "~TechRadar"; }
      { url = "https://www.zdnet.com/news/rss.xml"; title = "~ZDNET - News"; }
      { url = "https://thecheis.com/feed/"; title = "~THE_CHEI$"; }
      { url = "http://yro.slashdot.org/yro.rss"; title = "~Slashdot: Your Rights Online"; }
      { url = "https://freedom-to-tinker.com/feed/rss/"; title = "~Freedom to Tinker"; }
      { url = "https://act.eff.org/action.atom"; title = "~EFF - Action Center"; }
      { url = "https://www.eff.org/rss/updates.xml"; title = "~EFF - Updates"; }
      { url = "https://victorhckinthefreeworld.com/feed/"; title = "~Victorhck in the free world"; }
      { url = "https://theprivacydad.com/feed/"; title = "~Welcome to The Privacy Dad's Blog!"; }
      { url = "https://proton.me/blog/feed"; title = "~Proton Blog"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-2YHgc363EdcusLIBbgxzg"; title = "~YT - Joe Scott"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-9b7aDP6ZN0coj9-xFnrtw"; title = "~YT - Astrum"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-ErgHYY0_Yjhjz2MN1E1lg"; title = "~YT - RETRO Hardware"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-mTIBh__DzAqW495JHXy5A"; title = "~YT - The Coding Gopher"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-shHw-IWdyL7Y6JUz_mUMQ"; title = "~YT - SORRYLAG"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0-7PyfpOIJpNyi8WrHiyXA"; title = "~YT - Jason Carman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC05XpvbHZUQOfA6xk4dlmcw"; title = "~YT - DJ Ware"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0SyhPy7VsMQCIYDszFaplQ"; title = "~YT - Austin Eruption"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0W_BIuwk8D0Bv4THbVZZOQ"; title = "~YT - Surveillance Report"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0ggS8bt4v7NiZpDfGqNpZQ"; title = "~YT - ExtinctZoo "; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0woBco6Dgcxt0h8SwyyOmw"; title = "~YT - Megaprojects"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0z91or00IFw5xK5PXTQzqw"; title = "~YT - Sergio Hidalgo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1D3yD4wlPMico0dss264XA"; title = "~YT - NileBlue"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1InOoURG7RvFHlcTmZf5aA"; title = "~YT - Nomsy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1JTQBa5QxZCpXrFSkMxmPw"; title = "~YT - Raycevick"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1P7uWBazrqughX3FV-KLbA"; title = "~YT - Axl Kss"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1QdcIOh4l6l3a4udgU9bvw"; title = "~YT - Browntable"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1VLQPn9cYSqx8plbk9RxxQ"; title = "~YT - The Action Lab"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1_uAIS3r8Vu6JjXWvastJg"; title = "~YT - Mathologer"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1gKBgknwlQagEnq4Q-UnCg"; title = "~YT - Kiskeya Life"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1s1OsWNYDFgbROPV-q5arg"; title = "~YT - Michael Horn"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2WHjPDvbE6O328n17ZGcfg"; title = "~YT - ForrestKnight"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2avWDLN1EI3r1RZ_dlSxCw"; title = "~YT - Integza"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"; title = "~YT - Luke Smith"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC36xmz34q02JYaZYKrMwXng"; title = "~YT - Nate Gentile"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3AZigNkQD-7GQugXoH3xzA"; title = "~YT - sn0ren"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3SyoB0UuS2rsLWcU37eQ2w"; title = "~YT - Greg Owen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3Wn3dABlgESm8Bzn8Vamgg"; title = "~YT - Sideprojects"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3ewEwPUnReNd_mgwxOn9aQ"; title = "~YT - strager"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3jSNmKWYA04R47fDcc1ImA"; title = "~YT - InfinitelyGalactic"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3wz4IDh5T-Q3_ddfBVnivg"; title = "~YT - Lercin"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3yaWWA9FF9OBog5U9ml68A"; title = "~YT - SavvyNik"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4CsqctrGOn4NTz09sAhXwQ"; title = "~YT - Macho Nacho Productions"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4QZ_LsYcvcq7qOsOhpAX4A"; title = "~YT - ColdFusion"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4SVo0Ue36XCfOyb5Lh1viQ"; title = "~YT - Bro Code"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4bq21IPPbpu0Qrsl7LW0sw"; title = "~YT - Slidebean"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4w1YQAJMWOz4qtxinq55LQ"; title = "~YT - Level1Techs"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC52tAgsocr9DgrPec_iw1eg"; title = "~YT - Portfolio Courses"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5I2hjZYiW9gZPVkvzM8_Cw"; title = "~YT - Techmoan"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5KDiSAFxrDWhmysBcNqtMA"; title = "~YT - Eric Murphy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw"; title = "~YT - The Linux Experiment"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5nlKFUNoskvV5XdW6PbgYw"; title = "~YT - A Well-Rested Dog"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5r-nGeOFo4Y_njMURcbcwg"; title = "~YT - xeyt"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC64UiPJwM_e9AqAd7RiD7JA"; title = "~YT - Today I Found Out"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6FO-Up1-oLj5nNivCNHL-Q"; title = "~YT - Ryan Chapman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6WOxrSKLW8VagrNkfvi6EQ"; title = "~YT - THE SQUIDD"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6_J0wZdqcoRVs0Mck922SQ"; title = "~YT - Sheafification of G"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6biysICWOJ-C3P4Tyeggzg"; title = "~YT - Low Level"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6dI8msF1_I9HuDSvMtk_nQ"; title = "~YT - Akshon"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6gARF3ICgaLfs3o2znuqXA"; title = "~YT - Retro Recipes x Commodore"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7-Z34pbJ0ZAOJRmUCEz0Cg"; title = "~YT - Geography By Geoff"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7JNJKtjcFi6E0Akh5CwZLA"; title = "~YT - Atrium "; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7WDD6yHgzdqijHluCi1z-Q"; title = "~YT - The Act Man"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA"; title = "~YT - Mental Outlaw"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7kIy8fZavEni8Gzl8NLjOQ"; title = "~YT - Alex O'Connor"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7qPftDWPw9XuExpSgfkmJQ"; title = "~YT - Nostalgia Nerd"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC89AgkG34oooZubVt23wzFw"; title = "~YT - JLaservideo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw"; title = "~YT - ThePrimeagen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8LeXCWOalN8SxlrPcG-PaQ"; title = "~YT - midudev"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8bCGC81i_jYlL041-iAFSA"; title = "~YT - JWulen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8nqO3GJ8CcwKZ2UftEvBpw"; title = "~YT - Garrus"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8uT9cgJorJPWu7ITLGo9Ww"; title = "~YT - The 8-Bit Guy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9-y-6csu5WGm29I7JiwpnA"; title = "~YT - Computerphile"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC910yxBmXzGDH_2cx0XE0Xw"; title = "~YT - Plano de Juego"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9HOZ53gnHP3f_b-wixS74g"; title = "~YT - Boot dev"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9RM-iSvTu1uPJb8X5yp3EQ"; title = "~YT - Wendover Productions"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9bORzxOWiewqMXxkmhAwAg"; title = "~YT - Gingy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9h8BDcXwkhZtnqoQJ7PggA"; title = "~YT - Warfronts"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9rU_5YnMDUPc0IP8NwZOig"; title = "~YT - Elevated Systems"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCA2poLHLm6tIcjHN1OF9W2w"; title = "~YT - Nostalfan"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAMu6Dso0ENoNm3sKpQsy0g"; title = "~YT - Nir Lichtman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCASM0cgfkJxQ1ICmRilfHLw"; title = "~YT - Patrick Boyle"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAfYntJkyJdnYbzDsOGu0qQ"; title = "~YT - RetroSpector78"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAiEWppTvoNSHU939xhMb2g"; title = "~YT - hoser"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAiiOTio8Yu69c3XnR7nQBQ"; title = "~YT - System Crafters"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAmT6dFrJ0BcDVaz9yIkPew"; title = "~YT - Ccmaci"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBTZEtFw_-eLa1Vb5LPiGMA"; title = "~YT - SithDev"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBciYThS5hOiuQ4aOxw4hHg"; title = "~YT - Inkbox"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBdwqWmXhupzV5q8TfD-kNQ"; title = "~YT - The Critical Gamer"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBp33nQRejZkmujCMtnPJTQ"; title = "~YT - RetroBytes"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBq5p-xOla8xhnrbhu8AIAg"; title = "~YT - Tech Over Tea"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCC1p8piMqXKoUGosm8YeGuA"; title = "~YT - CodeNoodles"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCCsREoj8rSRkEvxWqxr74rQ"; title = "~YT - Cybernews"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCDUdeFslCNoM29MAlZOfdWQ"; title = "~YT - hdeleon.net"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCDZsyOkn-WTiTwgAvZSQ_cg"; title = "~YT - El Rincón De Giorgio"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCD_SqY872aJSEjh8CcBFB7g"; title = "~YT - Userlandia"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCD_zO_MDaC7MyekAmrn6WVQ"; title = "~YT - Astrum Extra"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCE0H52NoucHL2JkhPdZ1ykA"; title = "~YT - Jwlar"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEENWVBdvDy-QWfuQoXC9HQ"; title = "~YT - Species | Documenting AGI"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEEVcDuBRDiwxfXAgQjLGug"; title = "~YT - Dreams of Autonomy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEFymXY4eFCo_AchSpxwyrg"; title = "~YT - MetalJesusRocks"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEIwxahdLz7bap-VDs9h35A"; title = "~YT - Steve Mould"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEp20NgOZHmgWdbQdHSxgjw"; title = "~YT - This Does Not Compute"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFBC2r4eC54ym-QKob3PUTQ"; title = "~YT - Zenkai Goose"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFhXFikryT4aFcLkLw2LBLA"; title = "~YT - NileRed"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFk__1iexL3T5gvGcMpeHNA"; title = "~YT - Looking Glass Universe"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFzGNDHEZ5-7d5UXxfHUcRg"; title = "~YT - jujalag"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGE-JpLbibXJg3W_N2hbo8g"; title = "~YT - Sethorven"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGKEMK3s-ZPbjVOIuAV8clQ"; title = "~YT - Core Dumped"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGaVdbSav8xWuFWTadK6loA"; title = "~YT - vlogbrothers"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGsaijjOJshS2_ZmMNZgS-g"; title = "~YT - der8auer EN"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGy7SkBjcIAgTiwkXEtPnYg"; title = "~YT - Andrei Jikh"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCH5DsMZAgdx5Fkk9wwMNwCA"; title = "~YT - The New Oil"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHJ-02TEGNS2GeD2wYetHSQ"; title = "~YT - Luke Maximo Bell"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCH_7doiCkWeq0v3ycWE5lDw"; title = "~YT - Any Austin"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHmDySLF9yQVC1oTwZKWtSQ"; title = "~YT - Alex Webb"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA"; title = "~YT - Veritasium"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHvDhwNuq-h2hZQRR6BwbLQ"; title = "~YT - Tech With Nikola"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCI6pj4e-_6Km-dmLLYpmlaA"; title = "~YT - Alejandro Julián"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCIZ5ZOeiXYbmKTl_85ghNPw"; title = "~YT - Physics Explained"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCIjIAXXsX4YMYeFj-LP42-Q"; title = "~YT - Anthony GG"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJ0-OtVpF0wOKEqT2Z1HEtA"; title = "~YT - ElectroBOOM"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJXa3_WNNmIpewOtCHf3B0g"; title = "~YT - LaurieWired"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJYJgj7rzsn0vdR7fkgjuIA"; title = "~YT - styropyro"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJa14zeVf8p6clixTOIOVyQ"; title = "~YT - jakkuh"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJm2TgUqtK1_NLBrjNQ1P-w"; title = "~YT - Second Thought"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJquYOG5EL82sKTfH9aMA9Q"; title = "~YT - Rick Beato"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJsinEiaDqEn8a-GcADVEVA"; title = "~YT - Andrea Borman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCKGkjQogWhWfMDzK50ewqOQ"; title = "~YT - Concept Crafted Creations"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCKU7oz0NZLOml3dzGOjPfXg"; title = "~YT - Ben Makes Everything"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCL6JmiMXKoXS6bpP1D3bk8g"; title = "~YT - Donut"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLEoyoOKZK0idGqSc6Pi23w"; title = "~YT - The Retro Collective"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLx053rWZxCiYWsBETgdKrQ"; title = "~YT - LGR"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCM1og9pwIfAlg2jEtWh-Z7A"; title = "~YT - Sakharu Baguette"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMOqf8ab-42UUQIdVoKwjlQ"; title = "~YT - Practical Engineering"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMbQbVilo-nezMvwf1BZfAA"; title = "~YT - CienciaDeSofa"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMiyV_Ib77XLpzHPQH_q0qQ"; title = "~YT - Veronica Explains"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMnZ3qm76jc3SUi9Z-5OdcA"; title = "~YT - Leyendas & Videojuegos"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMwLVepB4YOgpyo48iyg7HA"; title = "~YT - Vercidium"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNYW2vfGrUE6R5mIJYzkRyQ"; title = "~YT - DrossRotzank"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNnNCBgckxzqIh1Txw5cgSg"; title = "~YT - BaityBait"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNzszbnvQeFzObW0ghk0Ckw"; title = "~YT - Dave's Garage"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCO2x-p9gg9TLKneXlibGR7w"; title = "~YT - Snazzy Labs"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCODHrzPMGbNv67e84WDZhQQ"; title = "~YT - fern"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCONH73CdRXUjlh3-DdLGCPw"; title = "~YT - Nicco Loves Linux"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOT2iLov0V7Re7ku_3UBtcQ"; title = "~YT - Hank Green"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOWcZ6Wicl-1N34H0zZe38w"; title = "~YT - Level1Linux"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOj2fwPsEYK8QcqaY6s5ziw"; title = "~YT - Betto"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOxmlaJURX3nq8eLuJPbl3A"; title = "~YT - Psivewri"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCP2bshADPrVMoNrdJvZEQzw"; title = "~YT - KeepItTechie"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCP5tjEmvPItGyLhmjdwP7Ww"; title = "~YT - RealLifeLore"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCP_eG7JBgRWNlNIOLYS6GZA"; title = "~YT - crin"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQ-W1KE9EYfdxhL6S4twUNw"; title = "~YT - The Cherno"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQ6fPy9wr7qnMxAbFOGBaLw"; title = "~YT - Computer Clan"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQSpnDG3YsFNf5-qHocF-WQ"; title = "~YT - ThioJoe"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQX_MZRCaluNKxkywkLEgfA"; title = "~YT - Date un Vlog"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQxK5A2gA5iZvb0Ky5i1leg"; title = "~YT - Doug Vargo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR-DXc1voovS8nhAvccRZhg"; title = "~YT - Jeff Geerling"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR1IuLEqb6UEA_zQ81kwXfg"; title = "~YT - Real Engineering"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR5v53B9L8lDvKScYrv1MUA"; title = "~YT - Surma"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCRYeRa2iUMd8An1WTPIP2bw"; title = "~YT - aChair Leg"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCRrHl7MO7gcwWguTTqDzBHw"; title = "~YT - LoneVaultWanderer"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCS-WzPVpAAli-1IfEG2lN8A"; title = "~YT - Michael MJD"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCS0N5baNlQWJCUrhCEo8WlA"; title = "~YT - Ben Eater"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCS4ITAOQlFP9_ny2Zl5b0ig"; title = "~YT - Stephen Antonioni"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSHZKyawb77ixDdsGog4iWA"; title = "~YT - Lex Fridman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSIvk78tK2TiviLQn4fSHaw"; title = "~YT - Up and Atom"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSJPFQdZwrOutnmSFYtbstA"; title = "~YT - The Critical Drinker"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSju5G2aFaWMqn-_0YBtq5A"; title = "~YT - Stand-up Maths"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSp-OaMpsO8K0KkOqyBl7_w"; title = "~YT - Let's Get Rusty"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSuHzQ3GrHSzoBbwrIq3LLA"; title = "~YT - Naomi Brockwell TV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCT6LaAC9VckZYJUzutUW3PQ"; title = "~YT - Game Sack"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCTROtIF7bDJc5klVGRzsMQw"; title = "~YT - polymatt"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCTrSsPMmZavLbc3Ex7VhjDg"; title = "~YT - Brandon Herrera"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCTvH45HvnOzqXvfNJqdc3xg"; title = "~YT - mossbag"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUEmaeh13ai1ivT5wzz5Lhg"; title = "~YT - Maxinomics"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA"; title = "~YT - No Boilerplate"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUP5UhD6cMfpN4vxW3FYJLQ"; title = "~YT - Sam Bent"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUeZBocfxALSUdOgNJB5ySA"; title = "~YT - Dr Ben Miles"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUg1Mw2dCuqCM2H0GzyAckQ"; title = "~YT - noRugrats"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUyeluBRhGPCW4rPe_UvBZQ"; title = "~YT - The PrimeTime"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCV4WgO-RWalz8izSKaHJrqg"; title = "~YT - Money Legends"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCV5vCi3jPJdURZwAOO_FNfQ"; title = "~YT - The Thought Emporium"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVIcSx0JX1lBXnyezabutrA"; title = "~YT - Shawn Wildermuth"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVahH6dIcO_pI2yZyqYhF0w"; title = "~YT - Alvaro Wasabi"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVeW9qkBjo3zosnqUbG7CFw"; title = "~YT - John Hammond"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVj_RIAE1KGK_tM-iJtb_xg"; title = "~YT - Pazos64"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVk4b-svNJoeytrrlOixebQ"; title = "~YT - TheVimeagen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg"; title = "~YT - DistroTube"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCW-HHEyt67RhZ6q21n4p2zQ"; title = "~YT - Mac84"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCW6MNdOsqv2E9AjQkv9we7A"; title = "~YT - PwnFunction"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCW6xlqxSY3gGur4PkGPEUeA"; title = "~YT - Seytonic"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWBtLCE-BnzZx3DneqDiXWQ"; title = "~YT - Astrum Earth"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWDGyt5hy6UA6Br-hAar03A"; title = "~YT - El Robot de Linneo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWEHue8kksIaktO8KTTN_zg"; title = "~YT - CodingEntrepreneurs"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWFNUk2LHUQdRzQcJLYZmcg"; title = "~YT - Bringus Studios"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWI-ohtRu8eEeDj93hmUsUQ"; title = "~YT - Coding with Lewis"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWMV8dD0N3tAM2W6GuNCUCg"; title = "~YT - theunrealtarik"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWQaM7SpSECp9FELz-cHzuQ"; title = "~YT - Dreams of Code"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWcp1Mwm7_bJ-mVoZb8TdkQ"; title = "~YT - TuberViejuner"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXCXxhRVYvBOX45_gxr0iHA"; title = "~YT - CROW HILL"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXp5qAXAmdQ8n3RUZaME1QQ"; title = "~YT - ItsYaBoyBrandyBoy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCYO_jab_esuFRV4b17AJtAw"; title = "~YT - 3Blue1Brown"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCYVU6rModlGxvJbszCclGGw"; title = "~YT - Rob Braxman Tech"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZ4AMrDcNrfy3X6nsU8-rPg"; title = "~YT - Economics Explained"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZBdaKw97n3P9qWeP6rs_7g"; title = "~YT - planet clue"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZRoNJu1OszFqABP8AuJIuw"; title = "~YT - Logically Answered"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZXW8E1__d5tZb-wLFOt8TQ"; title = "~YT - Bog"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZkPWp4MVoIVGLVLYC1Vjlg"; title = "~YT - Guille Ghemi"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZta4vDWgn93MOaLsp_GndA"; title = "~YT - Four Eyes"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC_lBPIZQ_mX5ERtvSlpBPEQ"; title = "~YT - JWulen 2"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCa-Qgwt5VxN0iP3q6reHN6g"; title = "~YT - Gavin Lon"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCa-lsDvCuyK6ZmkRLDlnzsg"; title = "~YT - LinuxChad"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCa6V1UVOXN4wDm7RDQDoa6g"; title = "~YT - El Traductor de Ingeniería"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCa8W2_uf81Ew6gYuw0VPSeA"; title = "~YT - Juxtopposed"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCaSCt8s_4nfkRglWCvNSDrg"; title = "~YT - CodeAesthetic"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCaVPhFg-Ax873wvhbNitsrQ"; title = "~YT - El Robot de Platón"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCaZmiLPf1trBZuksEGbBq0Q"; title = "~YT - eminwux"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCb0XKayhXq2JdoAHC2nr28Q"; title = "~YT - JARM"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbJEWVgCAO-gyHcQ7U7RPCg"; title = "~YT - Axel 1UP"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbdSYaPD-lr1kW27UJuk8Pw"; title = "~YT - QuantumFracture"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbfZu3aEzvSVjOnZnQr6r2Q"; title = "~YT - Explorist"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbiGcwDWZjz05njNPrJU7jA"; title = "~YT - ExplainingComputers"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcAy1o8VUCkdowxRYbc0XRw"; title = "~YT - Sebi's Random Tech"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcQWoBTNG__OwfZk9znWgCQ"; title = "~YT - The Rusty Bits"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcnUMbj2kQMRZBYxrAjZ_Lw"; title = "~YT - Davitxenko"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCct9aR7HC79Cv2g-9oDOTLw"; title = "~YT - ReligionForBreakfast"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCd4XwUn2Lure2NHHjukoCwA"; title = "~YT - Linux For Everyone"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCdB41UXrNAU_J7A7OnU4KSQ"; title = "~YT - Japan Gemu"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCdiJKSDwwvy4rMUVc9CgS-g"; title = "~YT - DaniboubeTV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCdn2zHVJ7NiiCDjTtg7VOxw"; title = "~YT - Barny Dillarstone"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCdp4_l1vPmpN-gDbUwhaRUQ"; title = "~YT - Branch Education"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCe8dQ26klK0jAb5yH0-qotw"; title = "~YT - zweek"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCeCtLnoV0nmE2cBbbftCCiw"; title = "~YT - Las reviews de Camilo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCeHOkFGW-7uAZFvq3BXb8YA"; title = "~YT - :3ildcat"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCefAbzsWZE4uXU-mqQMrr4Q"; title = "~YT - The Retro Future"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCerEIdrEW-IqwvlH8lTQUJQ"; title = "~YT - Tech Tangents"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCevUmOfLTUX9MNGJQKsPdIA"; title = "~YT - NeetCodeIO"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCf-U0uPVQZtcqXUWa_Hl4Mw"; title = "~YT - Into the Shadows"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCg6gPGh8HU2U01vaFCAsvmQ"; title = "~YT - Chris Titus Tech"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgFvT6pUq9HLOvKBYERzXSQ"; title = "~YT - Davie504"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgGw5WSITWvDISNjydXPW3A"; title = "~YT - GNCA - GamersNexus Consumer Advocacy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgNg3vwj3xt7QOrcIDaHdFg"; title = "~YT - PolyMatter"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgQ7Amr6fvCJyVlCwEi1bLw"; title = "~YT - Spectacles"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgbw0F-frjDxvQjzruGRJwg"; title = "~YT - The Serial Port"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgdTVe88YVSrOZ9qKumhULQ"; title = "~YT - Hardware Haven"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgmu30HaYVpa6aiKySHCz2w"; title = "~YT - Just1n"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgqt1RE0k0MIr0LoyJRy2lg"; title = "~YT - Rational Animations"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgzy7JqiE7qcpdnwu79dF_A"; title = "~YT - Mick Gordon"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChHxJaKDqH4bOs0pX3hkKnA"; title = "~YT - Basically Homeless"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChI0q9a-ZcbZh7dAu_-J-hg"; title = "~YT - Upper Echelon"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChIs72whgZI9w6d6FhwGGHA"; title = "~YT - Gamers Nexus"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChl-XKVVBAzoEVsnbOfpcqw"; title = "~YT - The Tank Museum"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChqXyHR4jxY9dDdN3sYr2ug"; title = "~YT - Aprendiendo con Marga"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChrYe70o7NmDioL02PRVWVg"; title = "~YT - MattKC"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCiBTOSmelfrflOhfoh3_4hQ"; title = "~YT - Kimu x64"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCiNLr9wX35KksK77mrQgxiw"; title = "~YT - 2swap"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCii9ezsUa_mBiSdw0PtSOaw"; title = "~YT - Hoog"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCizJl3TxBunh-LzpwyPYg0w"; title = "~YT - CHUPPL"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCj1VqrHhDte54oLgPG4xpuQ"; title = "~YT - Stuff Made Here"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCj7_98oQ0h7QVpmUHDtl45g"; title = "~YT - Kang Fasho"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCj8mAcR6Mu1dvaXQ6BdShRQ"; title = "~YT - The Masked Man"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCj8orMezFWVcoN-4S545Wtw"; title = "~YT - Max Derrat"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjFaPUcJU1vwk193mnW_w1w"; title = "~YT - Modern Vintage Gamer"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjSEJkpGbcZhvo0lr-44X_w"; title = "~YT - TechHut"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjgS6Uyg8ok4Jd_lH_MUKgg"; title = "~YT - Claus Kellerman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjr2bPAyPV7t35MvcgT3W8Q"; title = "~YT - The Hated One"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCkCGANrihzExmu9QiqZpPlQ"; title = "~YT - How Money Works"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCl2mFZoRqjw_ELax4Yisf6w"; title = "~YT - Louis Rossmann"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClZbmi9JzfnB2CEb0fG8iew"; title = "~YT - Primal Space"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCl_dlV_7ofr4qeP1drJQ-qg"; title = "~YT - Tantacrul"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClb90NQQcskPUGDIXsQEz5Q"; title = "~YT - developedbyed"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA"; title = "~YT - Brodie Robertson"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClnDI2sdehVm1zm_LmUHsjQ"; title = "~YT - Biographics"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCm8EsftbfNzSiRHzc7I59KQ"; title = "~YT - Kevin Fang"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmGSJVG3mCRXVOP4yZrU1Dw"; title = "~YT - Johnny Harris"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmJ5a16-2dJ8uvAA-1aj-hg"; title = "~YT - Restore Technique"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCma-YSz6yhJKJLFCdXA-DPA"; title = "~YT - voyan"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmtC7HJIoMQxkvV4gh5dP0Q"; title = "~YT - Philomatics"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmw-QGOHbHA5cDAvwwqUTKQ"; title = "~YT - Zaney"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmyGZ0689ODyReHw3rsKLtQ"; title = "~YT - Michael Tunnell"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCn-7h6n5Mff7t9yv5e6Opdw"; title = "~YT - Lifting Linux"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCn_xRMpw1ifOpVNN3AI3gVQ"; title = "~YT - Thinker"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCnw3aIEiz60S6O3XcztCVkQ"; title = "~YT - PatricianTV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCo5HJNjfdSoPWsdAHLsvSxQ"; title = "~YT - ShaunTrack"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCo6F7DjILD7tu9BEllVU9iw"; title = "~YT - Faultline"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCo71RUe6DX4w-Vd47rFLXPg"; title = "~YT - typecraft"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoEZ9FaZKS0iKbJeI5A_Vhg"; title = "~YT - Vivir Digital"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoL8olX-259lS1N6QPyP4IQ"; title = "~YT - Action Retro"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoLccjs6jbHa4soeYDgbKTg"; title = "~YT - Modern Classic"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UConVfxXodg78Tzh5nNu85Ew"; title = "~YT - Welch Labs"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoryWpk4QVYKFCJul9KBdyw"; title = "~YT - Switched to Linux"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoxcjq-8xIDTYp3uz647V5A"; title = "~YT - Numberphile"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpZjU-GdtNJO42H8xPDyxRQ"; title = "~YT - Ed Andersen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpa-Zb0ZcQjTCPP1Dx_1M8Q"; title = "~YT - LegalEagle"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpuKDBw8IVIdKWPhiB2VDNQ"; title = "~YT - Cinematix"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpuLiczP2Aqq11Gtf4k_fkw"; title = "~YT - Futurasound Productions"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpymQYvlXt2ZEcqwncmFjLw"; title = "~YT - Reacciona Explota"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCq2rNse2XX4Rjzmldv9GqrQ"; title = "~YT - rctestflight"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCq8LldVrjqe61KQttZlLW8g"; title = "~YT - Patrick God"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqnKDzxO2M_-B-MJYx5qz1Q"; title = "~YT - Ionic1k"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqoGR_EedlhKDVuWNwYWRbg"; title = "~YT - Voices of the Past"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqxM9T6ksiOVKIkb88S2r7Q"; title = "~YT - Zac Builds"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCr7akWbPrkMuLNEp2bO6Rng"; title = "~YT - reizett"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCrMjUYBsnWIbkXfaaLgDQKA"; title = "~YT - CodeSource"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCrkPsvLGln62OMZRO6K-llg"; title = "~YT - Nick Chapsas"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCs6KfncB4OV6Vug4o_bzijg"; title = "~YT - Techlore"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCs7nPQIEba0T3tGOWWsZpJQ"; title = "~YT - Like Stories of Old"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA"; title = "~YT - Fireship"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsC--WvN66vZlDoYShzn4sA"; title = "~YT - Oxhorn"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsXVk37bltHxD1rDPwtNM8Q"; title = "~YT - Kurzgesagt – In a Nutshell"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCshObcm-nLhbu8MY50EZ5Ng"; title = "~YT - Benn Jordan"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsnGwSIHyoYN0kiINAGUKxg"; title = "~YT - Wolfgang's Channel"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsrVDPJBYeXItETFHG0qzyw"; title = "~YT - Web Dev Cody"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCt2C2SFXm-r1TAh0yZ-M1LQ"; title = "~YT - lolzdev"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCt2z9lQN3jTztbjDHCW8qTg"; title = "~YT - Purplers"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtApDZWXv8fQaxZAk6dxYkw"; title = "~YT - Ghostcharm"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtMVHI3AJD4Qk4hcbZnI9ZQ"; title = "~YT - SomeOrdinaryGamers"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtRFmSyL4fSLQkn-wMqlmdA"; title = "~YT - History of the Universe"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtYKe7-XbaDjpUwcU5x0bLg"; title = "~YT - neo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtYg149E_wUGVmjGz-TgyNA"; title = "~YT - Chris Titus Technical"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtZX_67hSjOIPu0HTmFi6aw"; title = "~YT - Macintosh Librarian"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtsf0b8s6fWYK89vGMh4jAQ"; title = "~YT - mtt"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtwOODE1D8nh7KuhKYGP5Xw"; title = "~YT - Shortary"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCu0CCEzTTntkXUUdJC20i1w"; title = "~YT - Jamie's Brick Jams"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCudx6plmpbs5WtWvsvu-EdQ"; title = "~YT - Zeltik"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCuvSqzfO_LV_QzHdmEj84SQ"; title = "~YT - Kaze Emanuar"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCv6J_jJa8GJqFwQNgNrMuww"; title = "~YT - ServeTheHome"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCvW5ZYoNR2fkn0xkanZKdWA"; title = "~YT - Bryce Bostwick"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCvjgXvBlbQiydffZU7m1_aw"; title = "~YT - The Coding Train"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwHwDuNd9lCdA7chyyquDXw"; title = "~YT - Bread on Penguins"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwPdVunI5mD-dpuLogOawbw"; title = "~YT - adumb"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwQnoax3HWID1WOzZ4mqLPQ"; title = "~YT - Cole Hastings"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwbRile4jo-LcW_PQwmMdBw"; title = "~YT - Captain KRB"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCweDKPSF65wRw5VHFUJYiow"; title = "~YT - Curious Archive"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwkfNQzKwICfPKs6V0ZUFZQ"; title = "~YT - Hoshino Lina / 星乃リナ"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCx-PpwbajI5ToAY0WwJO2Kg"; title = "~YT - PortalRunner"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCx6cailiCkg_mlMM7JX5yfA"; title = "~YT - James Channel"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxPD7bsocoAMq8Dj18kmGyQ"; title = "~YT - MoureDev by Brais Moure"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxQKHvKbmSzGMvUrVtJYnUA"; title = "~YT - Learn Linux TV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxVPH8W2ayMey1-b0SY8rBQ"; title = "~YT - The Coding Sloth"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxYDwAloM-VWgiNtkWOtW0Q"; title = "~YT - Nokiru"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxdZ7XCQVMRMipj3gGemQfw"; title = "~YT - GNULectures"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxoz4YfS4M3H3C57FD4jW4Q"; title = "~YT - Science Time"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCy0tKL1T7wFoYcxCe0xjN6Q"; title = "~YT - Technology Connections"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCy6pDeDwRFi1kmFekSpMDUA"; title = "~YT - La Poción Roja"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCyEKvaxi8mt9FMc62MHcliw"; title = "~YT - Wrath of Math"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCyYkUq0qMNP-ea7LEvspkug"; title = "~YT - Los Ecomonos"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCybBViio_TH_uiFFDJuz5tg"; title = "~YT - Einzelgänger"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCylGUf9BvQooEFjgdNudoQg"; title = "~YT - The Linux Cast"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCz1oFxMrgrQ82-276UCOU9w"; title = "~YT - Atlas Pro"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCz7mxur_emoA8fl9kvizgtA"; title = "~YT - jazziiRed"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzDI_VuYb14FLu9f8uXOeSA"; title = "~YT - Joseju"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzGMBzt6UOMoQe_dqOfShZw"; title = "~YT - Cultura VJ"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzR-rom72PHN9Zg7RML9EbA"; title = "~YT - PBS Eons"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzXsTSZDoAPSjfHr8IZM9Ew"; title = "~YT - FloatyMonkey"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzrFWz6KrJy-VOz6D7EoT4w"; title = "~YT - La Chica de Sistemas"; }
    ];
  };
}
