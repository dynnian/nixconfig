{ lib, ... }: {
  services.throttled.enable = lib.mkDefault true;
  services."06cb-009a-fingerprint-sensor" = {                                 
    enable = true;                                                            
    backend = "python-validity";                                              
  };   
}
