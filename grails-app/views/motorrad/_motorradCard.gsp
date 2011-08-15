<div class="post">
    <div class="head">
        <span><g:link controller="hersteller" action="show" id="${ motorrad.hersteller.id }">${ motorrad.hersteller.name }</g:link></span> <span class="s">|</span>
        <span> ${ motorrad.comments.size() } comment </span>
    </div>
    <h3 class="title">${ motorrad.name }</h3>
	<rateable:ratings bean='${motorrad}'/>
    <div class="con">
        <p>${ motorrad.beschreibung }<g:link action="show" id="${ motorrad.id }" class="continue">Continue</g:link>
    </div>
</div>
