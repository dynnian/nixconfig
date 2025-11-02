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
      { url = "https://www.kdeblog.com/rss"; title = "~KDE Blog"; }
      { url = "https://thisweek.gnome.org/index.xml"; title = "~This Week on GNOME"; }
      { url = "https://www.omgubuntu.co.uk/feed"; title = "~OMG!Ubuntu"; }
      { url = "https://www.omglinux.com/feed"; title = "~OMG!Linux"; }
      { url = "https://blog.thunderbird.net/feed/"; title = "~The Thunderbird Blog"; }
      { url = "https://thelinuxexp.com/feed.xml"; title = "~The Linux Experiment"; }
      { url = "https://techhut.tv/feed/"; title = "~TechHut Media"; }
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
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-shHw-IWdyL7Y6JUz_mUMQ"; title = "~YT - SORRYLAG"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC05XpvbHZUQOfA6xk4dlmcw"; title = "~YT - DJ Ware"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0SyhPy7VsMQCIYDszFaplQ"; title = "~YT - Austin Eruption"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0W_BIuwk8D0Bv4THbVZZOQ"; title = "~YT - Surveillance Report"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0woBco6Dgcxt0h8SwyyOmw"; title = "~YT - Megaprojects"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC1D3yD4wlPMico0dss264XA"; title = "~YT - NileBlue"; }
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
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3SyoB0UuS2rsLWcU37eQ2w"; title = "~YT - Greg Owen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3Wn3dABlgESm8Bzn8Vamgg"; title = "~YT - Sideprojects"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3jSNmKWYA04R47fDcc1ImA"; title = "~YT - InfinitelyGalactic"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3yaWWA9FF9OBog5U9ml68A"; title = "~YT - SavvyNik"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4qG04RcOZ8J1Ncw5CPqsLA"; title = "~YT - Claus Kellerman POV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC4w1YQAJMWOz4qtxinq55LQ"; title = "~YT - Level1Techs"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC52tAgsocr9DgrPec_iw1eg"; title = "~YT - Portfolio Courses"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5I2hjZYiW9gZPVkvzM8_Cw"; title = "~YT - Techmoan"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5KDiSAFxrDWhmysBcNqtMA"; title = "~YT - Eric Murphy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw"; title = "~YT - The Linux Experiment"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5nlKFUNoskvV5XdW6PbgYw"; title = "~YT - A Well-Rested Dog"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC64UiPJwM_e9AqAd7RiD7JA"; title = "~YT - Today I Found Out"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6WOxrSKLW8VagrNkfvi6EQ"; title = "~YT - THE SQUIDD"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6biysICWOJ-C3P4Tyeggzg"; title = "~YT - Low Level"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7-Z34pbJ0ZAOJRmUCEz0Cg"; title = "~YT - Geography By Geoff"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7WDD6yHgzdqijHluCi1z-Q"; title = "~YT - The Act Man"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA"; title = "~YT - Mental Outlaw"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7kIy8fZavEni8Gzl8NLjOQ"; title = "~YT - Alex O'Connor"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7qPftDWPw9XuExpSgfkmJQ"; title = "~YT - Nostalgia Nerd"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8679JjreNLfSCgA-2Fb4kA"; title = "~YT - SpineCard"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw"; title = "~YT - ThePrimeagen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8bCGC81i_jYlL041-iAFSA"; title = "~YT - JWulen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8uT9cgJorJPWu7ITLGo9Ww"; title = "~YT - The 8-Bit Guy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9-y-6csu5WGm29I7JiwpnA"; title = "~YT - Computerphile"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC910yxBmXzGDH_2cx0XE0Xw"; title = "~YT - Plano de Juego"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9RM-iSvTu1uPJb8X5yp3EQ"; title = "~YT - Wendover Productions"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9bORzxOWiewqMXxkmhAwAg"; title = "~YT - Gingy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9h8BDcXwkhZtnqoQJ7PggA"; title = "~YT - Warfronts"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9rU_5YnMDUPc0IP8NwZOig"; title = "~YT - Elevated Systems"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAMu6Dso0ENoNm3sKpQsy0g"; title = "~YT - Nir Lichtman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCASM0cgfkJxQ1ICmRilfHLw"; title = "~YT - Patrick Boyle"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAfYntJkyJdnYbzDsOGu0qQ"; title = "~YT - RetroSpector78"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAiEWppTvoNSHU939xhMb2g"; title = "~YT - hoser"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAiiOTio8Yu69c3XnR7nQBQ"; title = "~YT - System Crafters"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBdwqWmXhupzV5q8TfD-kNQ"; title = "~YT - The Critical Gamer"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBq5p-xOla8xhnrbhu8AIAg"; title = "~YT - Tech Over Tea"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCDUdeFslCNoM29MAlZOfdWQ"; title = "~YT - hdeleon.net"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCDZsyOkn-WTiTwgAvZSQ_cg"; title = "~YT - El Rincón De Giorgio"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCD_SqY872aJSEjh8CcBFB7g"; title = "~YT - Userlandia"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCE0H52NoucHL2JkhPdZ1ykA"; title = "~YT - Jwlar"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEEVcDuBRDiwxfXAgQjLGug"; title = "~YT - Dreams of Autonomy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEFymXY4eFCo_AchSpxwyrg"; title = "~YT - MetalJesusRocks"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEIwxahdLz7bap-VDs9h35A"; title = "~YT - Steve Mould"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEp20NgOZHmgWdbQdHSxgjw"; title = "~YT - This Does Not Compute"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFhXFikryT4aFcLkLw2LBLA"; title = "~YT - NileRed"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFzGNDHEZ5-7d5UXxfHUcRg"; title = "~YT - jujalag"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGE-JpLbibXJg3W_N2hbo8g"; title = "~YT - Sethorven"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCH5DsMZAgdx5Fkk9wwMNwCA"; title = "~YT - The New Oil"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCH_7doiCkWeq0v3ycWE5lDw"; title = "~YT - Any Austin"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA"; title = "~YT - Veritasium"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHvDhwNuq-h2hZQRR6BwbLQ"; title = "~YT - Tech With Nikola"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCI6pj4e-_6Km-dmLLYpmlaA"; title = "~YT - Alejandro Julián"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCIjIAXXsX4YMYeFj-LP42-Q"; title = "~YT - Anthony GG"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJ0-OtVpF0wOKEqT2Z1HEtA"; title = "~YT - ElectroBOOM"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJYJgj7rzsn0vdR7fkgjuIA"; title = "~YT - styropyro"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJsinEiaDqEn8a-GcADVEVA"; title = "~YT - Andrea Borman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLEoyoOKZK0idGqSc6Pi23w"; title = "~YT - RMC - The Cave"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLx053rWZxCiYWsBETgdKrQ"; title = "~YT - LGR"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCM1og9pwIfAlg2jEtWh-Z7A"; title = "~YT - Sakharu Baguette"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMbQbVilo-nezMvwf1BZfAA"; title = "~YT - CienciaDeSofa"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMiyV_Ib77XLpzHPQH_q0qQ"; title = "~YT - Veronica Explains"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMnZ3qm76jc3SUi9Z-5OdcA"; title = "~YT - Leyendas & Videojuegos"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNYW2vfGrUE6R5mIJYzkRyQ"; title = "~YT - DrossRotzank"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNnNCBgckxzqIh1Txw5cgSg"; title = "~YT - BaityBait"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNzszbnvQeFzObW0ghk0Ckw"; title = "~YT - Dave's Garage"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCODHrzPMGbNv67e84WDZhQQ"; title = "~YT - fern"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCONH73CdRXUjlh3-DdLGCPw"; title = "~YT - Nicco Loves Linux"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOWcZ6Wicl-1N34H0zZe38w"; title = "~YT - Level1Linux"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOxmlaJURX3nq8eLuJPbl3A"; title = "~YT - Psivewri"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCP2bshADPrVMoNrdJvZEQzw"; title = "~YT - KeepItTechie"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCP5tjEmvPItGyLhmjdwP7Ww"; title = "~YT - RealLifeLore"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQ-W1KE9EYfdxhL6S4twUNw"; title = "~YT - The Cherno"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQSpnDG3YsFNf5-qHocF-WQ"; title = "~YT - ThioJoe"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQX_MZRCaluNKxkywkLEgfA"; title = "~YT - Date un Vlog"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR-DXc1voovS8nhAvccRZhg"; title = "~YT - Jeff Geerling"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR1IuLEqb6UEA_zQ81kwXfg"; title = "~YT - Real Engineering"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCRYeRa2iUMd8An1WTPIP2bw"; title = "~YT - aChair Leg"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCRrHl7MO7gcwWguTTqDzBHw"; title = "~YT - LoneVaultWanderer"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCS-WzPVpAAli-1IfEG2lN8A"; title = "~YT - Michael MJD"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCS0N5baNlQWJCUrhCEo8WlA"; title = "~YT - Ben Eater"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSIvk78tK2TiviLQn4fSHaw"; title = "~YT - Up and Atom"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSJPFQdZwrOutnmSFYtbstA"; title = "~YT - The Critical Drinker"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSju5G2aFaWMqn-_0YBtq5A"; title = "~YT - Stand-up Maths"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSp-OaMpsO8K0KkOqyBl7_w"; title = "~YT - Let's Get Rusty"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCSuHzQ3GrHSzoBbwrIq3LLA"; title = "~YT - Naomi Brockwell TV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCT6LaAC9VckZYJUzutUW3PQ"; title = "~YT - Game Sack"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCTrSsPMmZavLbc3Ex7VhjDg"; title = "~YT - Brandon Herrera"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA"; title = "~YT - No Boilerplate"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUeZBocfxALSUdOgNJB5ySA"; title = "~YT - Dr Ben Miles"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUyeluBRhGPCW4rPe_UvBZQ"; title = "~YT - ThePrimeTime"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVIcSx0JX1lBXnyezabutrA"; title = "~YT - Shawn Wildermuth"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVk4b-svNJoeytrrlOixebQ"; title = "~YT - TheVimeagen"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg"; title = "~YT - DistroTube"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCW-HHEyt67RhZ6q21n4p2zQ"; title = "~YT - Mac84"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWDGyt5hy6UA6Br-hAar03A"; title = "~YT - El Robot de Linneo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWEHue8kksIaktO8KTTN_zg"; title = "~YT - CodingEntrepreneurs"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWMV8dD0N3tAM2W6GuNCUCg"; title = "~YT - theunrealtarik"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWQaM7SpSECp9FELz-cHzuQ"; title = "~YT - Dreams of Code"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWcp1Mwm7_bJ-mVoZb8TdkQ"; title = "~YT - TuberViejuner"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXp5qAXAmdQ8n3RUZaME1QQ"; title = "~YT - ItsYaBoyBrandyBoy"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw"; title = "~YT - Linus Tech Tips"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCYO_jab_esuFRV4b17AJtAw"; title = "~YT - 3Blue1Brown"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCYVU6rModlGxvJbszCclGGw"; title = "~YT - Rob Braxman Tech"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZ4AMrDcNrfy3X6nsU8-rPg"; title = "~YT - Economics Explained"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZXW8E1__d5tZb-wLFOt8TQ"; title = "~YT - Bog"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZkPWp4MVoIVGLVLYC1Vjlg"; title = "~YT - Guille Ghemi"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCa-lsDvCuyK6ZmkRLDlnzsg"; title = "~YT - LinuxChad"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCa6V1UVOXN4wDm7RDQDoa6g"; title = "~YT - El Traductor de Ingeniería"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCaSCt8s_4nfkRglWCvNSDrg"; title = "~YT - CodeAesthetic"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCaVPhFg-Ax873wvhbNitsrQ"; title = "~YT - El Robot de Platón"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCb0XKayhXq2JdoAHC2nr28Q"; title = "~YT - JARM"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbJEWVgCAO-gyHcQ7U7RPCg"; title = "~YT - Axel 1UP"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbdSYaPD-lr1kW27UJuk8Pw"; title = "~YT - QuantumFracture"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbiGcwDWZjz05njNPrJU7jA"; title = "~YT - ExplainingComputers"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcAy1o8VUCkdowxRYbc0XRw"; title = "~YT - Sebi's Random Tech"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcQWoBTNG__OwfZk9znWgCQ"; title = "~YT - The Rusty Bits"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcnUMbj2kQMRZBYxrAjZ_Lw"; title = "~YT - Davitxenko"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCd4XwUn2Lure2NHHjukoCwA"; title = "~YT - Linux For Everyone"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCdB41UXrNAU_J7A7OnU4KSQ"; title = "~YT - Japan Gemu"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCdBK94H6oZT2Q7l0-b0xmMg"; title = "~YT - ShortCircuit"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCdiJKSDwwvy4rMUVc9CgS-g"; title = "~YT - DaniboubeTV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCdp4_l1vPmpN-gDbUwhaRUQ"; title = "~YT - Branch Education"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCeCtLnoV0nmE2cBbbftCCiw"; title = "~YT - Las reviews de Camilo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCeHOkFGW-7uAZFvq3BXb8YA"; title = "~YT - :3ildcat"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCerEIdrEW-IqwvlH8lTQUJQ"; title = "~YT - Tech Tangents"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCevUmOfLTUX9MNGJQKsPdIA"; title = "~YT - NeetCodeIO"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCf-U0uPVQZtcqXUWa_Hl4Mw"; title = "~YT - Into the Shadows"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCg6gPGh8HU2U01vaFCAsvmQ"; title = "~YT - Chris Titus Tech"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgNg3vwj3xt7QOrcIDaHdFg"; title = "~YT - PolyMatter"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgQ7Amr6fvCJyVlCwEi1bLw"; title = "~YT - Spectacles"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgbw0F-frjDxvQjzruGRJwg"; title = "~YT - The Serial Port"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgdTVe88YVSrOZ9qKumhULQ"; title = "~YT - Hardware Haven"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgzy7JqiE7qcpdnwu79dF_A"; title = "~YT - Mick Gordon"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChI0q9a-ZcbZh7dAu_-J-hg"; title = "~YT - Upper Echelon"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChIs72whgZI9w6d6FhwGGHA"; title = "~YT - Gamers Nexus"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChrYe70o7NmDioL02PRVWVg"; title = "~YT - MattKC"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCizJl3TxBunh-LzpwyPYg0w"; title = "~YT - CHUPPL"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCj8mAcR6Mu1dvaXQ6BdShRQ"; title = "~YT - The Masked Man"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCj8orMezFWVcoN-4S545Wtw"; title = "~YT - Max Derrat"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjFaPUcJU1vwk193mnW_w1w"; title = "~YT - Modern Vintage Gamer"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjSEJkpGbcZhvo0lr-44X_w"; title = "~YT - TechHut"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjgS6Uyg8ok4Jd_lH_MUKgg"; title = "~YT - Claus Kellerman"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCl2mFZoRqjw_ELax4Yisf6w"; title = "~YT - Louis Rossmann"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCl_dlV_7ofr4qeP1drJQ-qg"; title = "~YT - Tantacrul"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClb90NQQcskPUGDIXsQEz5Q"; title = "~YT - developedbyed"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA"; title = "~YT - Brodie Robertson"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClnDI2sdehVm1zm_LmUHsjQ"; title = "~YT - Biographics"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCm8EsftbfNzSiRHzc7I59KQ"; title = "~YT - Kevin Fang"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmGSJVG3mCRXVOP4yZrU1Dw"; title = "~YT - Johnny Harris"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmw-QGOHbHA5cDAvwwqUTKQ"; title = "~YT - Zaney"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmyGZ0689ODyReHw3rsKLtQ"; title = "~YT - Michael Tunnell"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCnw3aIEiz60S6O3XcztCVkQ"; title = "~YT - PatricianTV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCo5HJNjfdSoPWsdAHLsvSxQ"; title = "~YT - ShaunTrack"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCo71RUe6DX4w-Vd47rFLXPg"; title = "~YT - typecraft"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoL8olX-259lS1N6QPyP4IQ"; title = "~YT - Action Retro"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoLccjs6jbHa4soeYDgbKTg"; title = "~YT - Modern Classic"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UConVfxXodg78Tzh5nNu85Ew"; title = "~YT - Welch Labs"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoryWpk4QVYKFCJul9KBdyw"; title = "~YT - Switched to Linux"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoxcjq-8xIDTYp3uz647V5A"; title = "~YT - Numberphile"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpuKDBw8IVIdKWPhiB2VDNQ"; title = "~YT - Cinematix"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpuLiczP2Aqq11Gtf4k_fkw"; title = "~YT - Futurasound Productions"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpymQYvlXt2ZEcqwncmFjLw"; title = "~YT - Reacciona Explota"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCq8LldVrjqe61KQttZlLW8g"; title = "~YT - Patrick God"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqoGR_EedlhKDVuWNwYWRbg"; title = "~YT - Voices of the Past"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqxM9T6ksiOVKIkb88S2r7Q"; title = "~YT - Zac Builds"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCrkPsvLGln62OMZRO6K-llg"; title = "~YT - Nick Chapsas"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCs6KfncB4OV6Vug4o_bzijg"; title = "~YT - Techlore"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCs7nPQIEba0T3tGOWWsZpJQ"; title = "~YT - Like Stories of Old"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA"; title = "~YT - Fireship"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsC--WvN66vZlDoYShzn4sA"; title = "~YT - Oxhorn"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsnGwSIHyoYN0kiINAGUKxg"; title = "~YT - Wolfgang's Channel"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsrVDPJBYeXItETFHG0qzyw"; title = "~YT - Web Dev Cody"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtApDZWXv8fQaxZAk6dxYkw"; title = "~YT - Ghostcharm"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtMVHI3AJD4Qk4hcbZnI9ZQ"; title = "~YT - SomeOrdinaryGamers"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtYKe7-XbaDjpUwcU5x0bLg"; title = "~YT - neo"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtYg149E_wUGVmjGz-TgyNA"; title = "~YT - Titus Tech Talk"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtZX_67hSjOIPu0HTmFi6aw"; title = "~YT - Macintosh Librarian"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtsf0b8s6fWYK89vGMh4jAQ"; title = "~YT - mtt"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCudx6plmpbs5WtWvsvu-EdQ"; title = "~YT - Zeltik"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCv6J_jJa8GJqFwQNgNrMuww"; title = "~YT - ServeTheHome"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCvjgXvBlbQiydffZU7m1_aw"; title = "~YT - The Coding Train"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwHwDuNd9lCdA7chyyquDXw"; title = "~YT - Bread on Penguins"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwkfNQzKwICfPKs6V0ZUFZQ"; title = "~YT - Asahi Lina / 朝日リナ"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCx6cailiCkg_mlMM7JX5yfA"; title = "~YT - James Channel"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxQKHvKbmSzGMvUrVtJYnUA"; title = "~YT - Learn Linux TV"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxdZ7XCQVMRMipj3gGemQfw"; title = "~YT - GNULectures"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxoz4YfS4M3H3C57FD4jW4Q"; title = "~YT - Science Time"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCy0tKL1T7wFoYcxCe0xjN6Q"; title = "~YT - Technology Connections"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCy6pDeDwRFi1kmFekSpMDUA"; title = "~YT - La Poción Roja"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCybBViio_TH_uiFFDJuz5tg"; title = "~YT - Einzelgänger"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCylGUf9BvQooEFjgdNudoQg"; title = "~YT - The Linux Cast"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCz1oFxMrgrQ82-276UCOU9w"; title = "~YT - Atlas Pro"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzDI_VuYb14FLu9f8uXOeSA"; title = "~YT - Joseju"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzGMBzt6UOMoQe_dqOfShZw"; title = "~YT - Cultura VJ"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzR-rom72PHN9Zg7RML9EbA"; title = "~YT - PBS Eons"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzXsTSZDoAPSjfHr8IZM9Ew"; title = "~YT - FloatyMonkey"; }
    ];
  };
}