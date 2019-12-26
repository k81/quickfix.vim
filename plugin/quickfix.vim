function ToggleQuickfix()
    " remember where we are
    let winnr = winnr()
    " find qf window, if any
    let qfw = 0
    windo if &l:buftype == "quickfix" | let qfw = winnr() | endif
    if qfw
        " close qf window
        cclose
    else
        " open qf window as last window, fullwidth
        botright copen
    endif
    " go back to where we started from
    if (winnr >= qfw) && (winnr > 1)
        let winnr = winnr - 1
    endif
    exe winnr "wincmd w"
endfunction
command -nargs=0 -bar QFToggle call ToggleQuickfix() 
