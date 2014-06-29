let s:unite_source = {'name': 'fasd'}

function! s:unite_source.gather_candidates(args, context)
  let candidates_with_scores = split(system("bash -ic 'f'"), '\n')
  let cand = map(candidates_with_scores, 'split(v:val)[1]')

  return map(cand, '{"word": v:val, "kind": "file", "action__path": v:val}')
endfunction

function! unite#sources#fasd#define()
  return s:unite_source
endfunction