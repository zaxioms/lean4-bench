fun erato top =
  let
    fun listGen 0 = []
      | listGen n = true::(listGen (n-1))

    fun setList (L, v, n) = 
      let
        val l1 = List.take(L, n)
        val x::l2 = List.drop(L, n)
      in
        l1@(v::l2)
      end

    fun removeMuls p l =
      let
        val counter' = ref (p*p)
      in
        while (!counter') < top do (
          l := setList (!l, false, !counter');
          counter' := !counter' + p
        )
      end

    val res = ref (listGen top)
    val counter = ref 2
    
    val startTime = Time.now()

    val _ = 
      while ((!counter)*(!counter)) < top do (
        removeMuls (!counter) res;
        counter := !counter + 1
    );

    val endTime = Time.now()
    val out = List.drop(!res, 1)

  in
    Time.toReal (Time.-(endTime, startTime))
  end
