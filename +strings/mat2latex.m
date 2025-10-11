function str = mat2latex(fmt, A)
  str = pwintz.strings.sprintmat(fmt, A, columnSep=" & ", rowSep=" \\\\\\\\ ");
end % end function