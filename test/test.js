var assert = require("assert")

describe('Fails', function(){
  describe('#test()', function(){
    it('should fail', function(){
      assert.equal(true, false);
    })
  })
})
