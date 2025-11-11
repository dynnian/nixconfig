{
  settings = {
    mgr = {
      ratio = [ 1 4 3 ];
      sort_by = "natural";
      sort_sensitive = false;
      sort_reverse = false;
      sort_dir_first = true;
      sort_translit = false;
      linemode = "none";
      show_hidden = false;
      show_symlink = true;
      scrolloff = 5;
      mouse_events = [ "click" "scroll" ];
      title_format = "Yazi: {cwd}";
    };
    preview = {
      tab_size = 2;
      max_width = 600;
      max_height = 900;
      cache_dir = "";
      image_filter = "triangle";
      image_quality = 75;
      sixel_fraction = 15;
      ueberzug_scale = 1;
      ueberzug_offset = [ 0 0 0 0 ];
    };
    opener = {
      edit = [
        {
          run = ''${"EDITOR:-vim"} "$@"'';
          desc = "$EDITOR";
          block = true;
          for = "unix";
        }
      ];
      open = [
        {
          run = ''xdg-open "$1"'';
          desc = "Open";
          for = "linux";
        }
      ];
      reveal = [
        {
          run = ''xdg-open "$(dirname "$1")"'';
          desc = "Reveal";
          for = "linux";
        }
        {
          run = ''exiftool "$1"; echo "Press enter to exit"; read _'';
          block = true;
          desc = "Show EXIF";
          for = "unix";
        }
      ];
      extract = [
        {
          run = ''ya pub extract --list "$@"'';
          desc = "Extract here";
          for = "unix";
        }
      ];
      play = [
        {
          run = ''mpv --force-window "$@"'';
          orphan = true;
          for = "unix";
        }
        {
          run = ''mediainfo "$1"; echo "Press enter to exit"; read _'';
          block = true;
          desc = "Show media info";
          for = "unix";
        }
      ];
      pdf = [
        {
          run = ''zathura "$@"'';
          desc = "Zathura";
          orphan = true;
          for = "unix";
        }
      ];
      office = [
        {
          run = ''onlyoffice-desktopeditors "$@"'';
          desc = "OnlyOffice";
          orphan = true;
          for = "unix";
        }
      ];
      browser = [
        {
          run = ''${BROWSER:-firefox} "$@"'';
          desc = "$BROWSER (fallback firefox)";
          orphan = true;
          for = "unix";
        }
      ];
    };
    open = {
      rules = [
        { name = "*/"; use = [ "edit" "open" "reveal" ]; }
        { mime = "text/html"; use = [ "browser" "reveal" ]; }
        { name = "*.{htm,html,xhtml}"; use = [ "browser" "reveal" ]; }
        { mime = "application/pdf"; use = [ "pdf" "reveal" ]; }
        { name = "*.{pdf}"; use = [ "pdf" "reveal" ]; }
        { mime = "application/{vnd.openxmlformats-officedocument*,msword,vnd.ms-excel,vnd.ms-powerpoint,vnd.ms-*,vnd.oasis.opendocument*}"; use = [ "office" "reveal" ]; }
        { name = "*.{doc,docx,xls,xlsx,ppt,pptx,odt,ods,odp,rtf}"; use = [ "office" "reveal" ]; }
        { mime = "text/*"; use = [ "edit" "reveal" ]; }
        { mime = "image/*"; use = [ "open" "reveal" ]; }
        { mime = "{audio,video}/*"; use = [ "play" "reveal" ]; }
        { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}"; use = [ "extract" "reveal" ]; }
        { mime = "application/{json,ndjson}"; use = [ "edit" "reveal" ]; }
        { mime = "*/javascript"; use = [ "edit" "reveal" ]; }
        { mime = "inode/empty"; use = [ "edit" "reveal" ]; }
        { name = "*"; use = [ "open" "reveal" ]; }
      ];
    };
    tasks = {
      micro_workers = 10;
      macro_workers = 10;
      bizarre_retry = 3;
      image_alloc = 536870912;
      image_bound = [ 0 0 ];
      suppress_preload = false;
    };
    plugin = {
      fetchers = [{ id = "mime"; name = "*"; run = "mime"; prio = "high"; }];
      preloaders = [
        { mime = "image/{avif,hei?,jxl,svg+xml}"; run = "magick"; }
        { mime = "image/*"; run = "image"; }
        { mime = "video/*"; run = "video"; }
        { mime = "application/pdf"; run = "pdf"; }
        { mime = "font/*"; run = "font"; }
        { mime = "application/ms-opentype"; run = "font"; }
      ];
      previewers = [
        { name = "*/"; run = "folder"; sync = true; }
        { mime = "text/*"; run = "code"; }
        { mime = "application/{mbox,javascript,wine-extension-ini}"; run = "code"; }
        { mime = "application/{json,ndjson}"; run = "json"; }
        { mime = "image/{avif,hei?,jxl,svg+xml}"; run = "magick"; }
        { mime = "image/*"; run = "image"; }
        { mime = "video/*"; run = "video"; }
        { mime = "application/pdf"; run = "pdf"; }
        { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}"; run = "archive"; }
        { mime = "application/{debian*-package,redhat-package-manager,rpm,android.package-archive}"; run = "archive"; }
        { name = "*.{AppImage,appimage}"; run = "archive"; }
        { mime = "application/{iso9660-image,qemu-disk,ms-wim,apple-diskimage}"; run = "archive"; }
        { mime = "application/virtualbox-{vhd,vhdx}"; run = "archive"; }
        { name = "*.{img,fat,ext,ext2,ext3,ext4,squashfs,ntfs,hfs,hfsx}"; run = "archive"; }
        { mime = "font/*"; run = "font"; }
        { mime = "application/ms-opentype"; run = "font"; }
        { mime = "inode/empty"; run = "empty"; }
        { name = "*"; run = "file"; }
      ];
    };
    input = {
      cursor_blink = false;
      cd_title = "Change directory:";
      cd_origin = "top-center";
      cd_offset = [ 0 2 50 3 ];
      create_title = [ "Create:" "Create (dir):" ];
      create_origin = "top-center";
      create_offset = [ 0 2 50 3 ];
      rename_title = "Rename:";
      rename_origin = "hovered";
      rename_offset = [ 0 1 50 3 ];
      filter_title = "Filter:";
      filter_origin = "top-center";
      filter_offset = [ 0 2 50 3 ];
      find_title = [ "Find next:" "Find previous:" ];
      find_origin = "top-center";
      find_offset = [ 0 2 50 3 ];
      search_title = "Search via {n}:";
      search_origin = "top-center";
      search_offset = [ 0 2 50 3 ];
      shell_title = [ "Shell:" "Shell (block):" ];
      shell_origin = "top-center";
      shell_offset = [ 0 2 50 3 ];
      overwrite_title  = "Overwrite an existing file? (y/N)";
      overwrite_origin = "top-center";
      overwrite_offset = [ 0 2 50 3 ];
      quit_title  = "{n} task{s} running, sure to quit? (y/N)";
      quit_origin = "top-center";
      quit_offset = [ 0 2 50 3 ];
    };
    select = {
      open_title = "Open with:";
      open_origin = "hovered";
      open_offset = [ 0 1 50 7 ];
    };
    which = {
      sort_by = "none";
      sort_sensitive = false;
      sort_reverse = false;
      sort_translit = false;
    };
    log = {
      enabled = false;
    };
  };
}
