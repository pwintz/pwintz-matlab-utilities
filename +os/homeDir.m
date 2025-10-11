function homedir = homeDir()
  homedir = char(java.lang.System.getProperty('user.home'));
end % end function