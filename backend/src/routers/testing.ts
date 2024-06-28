import { Router } from "express";

const router = Router();

router.get("/testing", async (req, res) => {

  res.json({
    user: "tested"
  })


})
router.get("/jenkins", async (req, res) => {

  res.json({
    user: "jenkinsTestCompleted"
  })


})



export default router;