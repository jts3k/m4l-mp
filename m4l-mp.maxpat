{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 10,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 326.0, 260.0, 410.0, 472.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 640.0, -33.0, 82.0, 22.0 ],
					"text" : "r centeroption"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 87.5, 132.0, 84.0, 22.0 ],
					"text" : "s centeroption"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 87.5, 102.0, 33.0, 22.0 ],
					"text" : "== 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 640.0, -4.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 640.0, 31.0, 57.0, 22.0 ],
					"text" : "active $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-type-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 170.5, 106.0, 55.0, 22.0 ],
					"text" : "type $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1133.0, 324.0, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1133.0, 289.0, 212.0, 22.0 ],
					"text" : "combine Confidence: \" \" 1 @triggers 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 945.0, 323.0, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 945.0, 288.0, 183.0, 22.0 ],
					"text" : "combine Count: \" \" 1 @triggers 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 251.0, 271.0, 29.5, 20.0 ],
					"text" : "i"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 248.0, 354.0, 77.0, 20.0 ],
					"text" : "prepend port"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-8",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 251.0, 225.5, 45.0, 13.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 211.0, 128.0, 45.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 9000.0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "port",
							"parameter_mmax" : 12000.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "port",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "port"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 145.0, 271.0, 59.0, 20.0 ],
					"text" : "route text"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 145.0, 354.0, 79.0, 20.0 ],
					"text" : "prepend host"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 10,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 183.0, 263.0, 1000.0, 759.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 280.0, 259.0, 22.0 ],
									"text" : "list.join"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 50.0, 152.0, 29.5, 22.0 ],
									"text" : "t b l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 227.0, 159.0, 22.0 ],
									"text" : "combine /mediapipe/pose/ 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 186.0, 79.0, 61.0, 22.0 ],
									"text" : "list.slice 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 186.0, 19.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 362.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 1 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 1 ],
									"midpoints" : [ 70.0, 194.79296875, 299.5, 194.79296875 ],
									"source" : [ "obj-15", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 850.0, 425.0, 136.0, 20.0 ],
					"text" : "p message-construction"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 10,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 490.0, 174.0, 1000.0, 759.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 280.0, 259.0, 22.0 ],
									"text" : "list.join"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 50.0, 152.0, 29.5, 22.0 ],
									"text" : "t b l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 227.0, 155.0, 22.0 ],
									"text" : "combine /mediapipe/face/ 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 186.0, 79.0, 61.0, 22.0 ],
									"text" : "list.slice 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 186.0, 19.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 362.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 1 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 1 ],
									"midpoints" : [ 70.0, 194.79296875, 299.5, 194.79296875 ],
									"source" : [ "obj-15", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 650.0, 425.0, 136.0, 20.0 ],
					"text" : "p message-construction"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 10,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 0.0, 1000.0, 759.200000000000045 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 280.0, 45.0, 22.0 ],
									"text" : "list.join"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 57.75, 152.0, 29.5, 22.0 ],
									"text" : "t b l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 234.0, 159.0, 22.0 ],
									"text" : "combine /mediapipe/hand/ 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 57.75, 100.0, 61.0, 22.0 ],
									"text" : "list.slice 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 57.75, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 362.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 1 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 1 ],
									"source" : [ "obj-15", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 487.875, 425.0, 136.0, 20.0 ],
					"text" : "p message-construction"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 10,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 114.0, 1000.0, 759.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-osc-conf",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 130.0, 100.0, 145.0, 22.0 ],
									"text" : "/mediapipe/confidence $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-sel-status",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 4,
									"outlettype" : [ "bang", "bang", "bang", "" ],
									"patching_rect" : [ 50.0, 135.0, 147.0, 22.0 ],
									"text" : "sel ready running stopped"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-led-ready",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 165.0, 125.0, 22.0 ],
									"text" : "bgcolor 0.9 0.7 0.1 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-led-on",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 90.0, 195.0, 125.0, 22.0 ],
									"text" : "bgcolor 0.2 0.8 0.2 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-led-off",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 135.0, 225.0, 125.0, 22.0 ],
									"text" : "bgcolor 0.5 0.5 0.5 1."
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 130.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-8",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 85.666672000000005, 307.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-9",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 307.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-sel-status", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-osc-conf", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-led-off", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-led-on", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-led-ready", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-osc-conf", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-led-off", 0 ],
									"source" : [ "obj-sel-status", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-led-on", 0 ],
									"source" : [ "obj-sel-status", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-led-ready", 0 ],
									"source" : [ "obj-sel-status", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 330.0, 267.0, 51.0, 20.0 ],
					"text" : "p status"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 14.0,
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 145.0, 11.0, 152.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 10.0, 142.0, 20.0 ],
					"text" : "M4L Mediapipe"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-type-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 145.0, 41.0, 34.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 110.0, 77.0, 30.0, 16.0 ],
					"text" : "Type"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-type-menu",
					"items" : [ "hand", ",", "face", ",", "pose" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 145.0, 61.0, 70.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 146.0, 76.0, 60.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-camera-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 330.0, 41.0, 44.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 62.0, 44.0, 16.0 ],
					"text" : "Camera"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-camera-menu",
					"items" : [ "FaceTime HD Camera", ",", "OBS Virtual Camera", ",", "Jesse’s Inscrutable Telephone Camera" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 330.0, 61.0, 120.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 80.0, 100.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-camera-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 330.0, 91.0, 95.0, 20.0 ],
					"text" : "cameraMenu $1"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 10.0,
					"id" : "obj-scan-btn",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"parameter_mappable" : 0,
					"patching_rect" : [ 460.0, 61.0, 78.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 101.0, 100.0, 20.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2,
							"parameter_linknames" : 1,
							"parameter_longname" : "scan-cameras",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "scan-cameras",
							"parameter_type" : 2
						}

					}
,
					"text" : "Rescan cameras",
					"varname" : "scan-cameras"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-scan-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 460.0, 91.0, 72.0, 20.0 ],
					"text" : "listCameras"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-bodies-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 41.0, 70.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 110.0, 103.0, 70.0, 16.0 ],
					"text" : "Tracking limit:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-bodies",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 550.0, 61.0, 45.0, 13.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 182.0, 104.0, 26.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 1.0 ],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "tracking-limit",
							"parameter_mmax" : 10.0,
							"parameter_mmin" : 1.0,
							"parameter_modmode" : 3,
							"parameter_shortname" : "tracking-limit",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "tracking-limit"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-bodies-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 91.0, 85.0, 20.0 ],
					"text" : "numBodies $1"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 10.0,
					"id" : "obj-center",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 640.0, 61.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 212.0, 103.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_linknames" : 1,
							"parameter_longname" : "center",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "center",
							"parameter_type" : 2
						}

					}
,
					"text" : "Center",
					"texton" : "Center",
					"varname" : "center"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-center-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 640.0, 91.0, 59.0, 20.0 ],
					"text" : "center $1"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 10.0,
					"id" : "obj-startstop",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 720.0, 61.0, 44.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 212.0, 78.0, 44.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_linknames" : 1,
							"parameter_longname" : "run",
							"parameter_mmax" : 1,
							"parameter_modmode" : 0,
							"parameter_shortname" : "run",
							"parameter_type" : 2
						}

					}
,
					"text" : "Run",
					"texton" : "Run",
					"varname" : "run"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-sel-startstop",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 720.0, 96.0, 55.0, 20.0 ],
					"text" : "sel 0 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-stop-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 720.0, 126.0, 32.0, 20.0 ],
					"text" : "stop"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-start-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 765.0, 126.0, 33.0, 20.0 ],
					"text" : "start"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-status-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 899.0, 288.0, 43.0, 18.0 ],
					"text" : "Status"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.9, 0.7, 0.1, 1.0 ],
					"id" : "obj-status-led",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 899.0, 308.0, 20.0, 20.0 ],
					"proportion" : 0.39
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-count-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 945.0, 376.0, 54.0, 18.0 ],
					"text" : "Count: 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-conf-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1133.0, 376.0, 83.0, 18.0 ],
					"text" : "Confidence: 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-host-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 145.0, 201.0, 54.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 127.0, 54.0, 16.0 ],
					"text" : "OSC Host"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.152941176470588, 0.152941176470588, 0.152941176470588, 1.0 ],
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-host",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 145.0, 221.0, 77.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 58.0, 127.0, 70.0, 16.5 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_control_text_bg"
						}
,
						"valueof" : 						{
							"parameter_initial" : [ "127.0.0.1" ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "host",
							"parameter_modmode" : 0,
							"parameter_shortname" : "host",
							"parameter_type" : 3
						}

					}
,
					"text" : "127.0.0.1",
					"varname" : "host"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-port-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 250.0, 201.0, 51.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 160.0, 127.0, 51.0, 16.0 ],
					"text" : "OSC Port"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-udpsend",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 145.0, 693.0, 138.0, 20.0 ],
					"text" : "udpsend 127.0.0.1 9000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-node",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 330.0, 201.0, 200.0, 20.0 ],
					"saved_object_attributes" : 					{
						"autostart" : 1,
						"defer" : 0,
						"watch" : 1
					}
,
					"text" : "node.script mediapipe-tracker.js",
					"textfile" : 					{
						"filename" : "mediapipe-tracker.js",
						"flags" : 0,
						"embed" : 0,
						"autowatch" : 1
					}

				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-print",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 201.0, 75.0, 20.0 ],
					"text" : "print [n4m]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-route-node",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 9,
					"outlettype" : [ "", "", "", "", "", "", "", "", "" ],
					"patching_rect" : [ 330.0, 236.0, 440.0, 20.0 ],
					"text" : "route status count confidence landmarks centered bbox cameras handedness"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-route-landmarks",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 487.875, 366.0, 130.0, 20.0 ],
					"text" : "route hand face pose"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-osc-centered",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 540.5, 315.0, 151.0, 20.0 ],
					"text" : "/mediapipe/centered/$1 $2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-osc-bbox",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 694.5, 315.0, 180.0, 20.0 ],
					"text" : "/mediapipe/bbox/$1 $2 $3 $4 $5"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"id" : "obj-osc-count",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 382.0, 315.0, 118.0, 20.0 ],
					"text" : "/mediapipe/count $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 372.0, 752.0, 53.0, 18.0 ],
					"text" : "plugout~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans Medium Bold",
					"fontsize" : 10.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 372.0, 672.0, 53.0, 18.0 ],
					"text" : "plugin~"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"midpoints" : [ 415.5, 693.0, 415.5, 693.0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 381.5, 693.0, 381.5, 693.0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-status-led", 0 ],
					"midpoints" : [ 339.5, 300.0, 908.5, 300.0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 371.5, 657.0, 154.5, 657.0 ],
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"midpoints" : [ 260.5, 351.0, 257.5, 351.0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"midpoints" : [ 954.5, 309.0, 954.5, 309.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-count-label", 0 ],
					"midpoints" : [ 954.5, 345.0, 954.5, 345.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-conf-label", 0 ],
					"midpoints" : [ 1142.5, 345.0, 1142.5, 345.0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 1142.5, 312.0, 1142.5, 312.0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-center", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 497.375, 657.0, 154.5, 657.0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 659.5, 657.0, 154.5, 657.0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 859.5, 657.0, 154.5, 657.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 154.5, 375.0, 154.5, 375.0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 154.5, 291.0, 154.5, 291.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 260.5, 240.0, 260.5, 240.0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 257.5, 678.0, 154.5, 678.0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-bodies-msg", 0 ],
					"midpoints" : [ 559.5, 75.0, 559.5, 75.0 ],
					"source" : [ "obj-bodies", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-node", 0 ],
					"midpoints" : [ 559.5, 186.0, 339.5, 186.0 ],
					"source" : [ "obj-bodies-msg", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-camera-msg", 0 ],
					"midpoints" : [ 339.5, 81.0, 339.5, 81.0 ],
					"source" : [ "obj-camera-menu", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-node", 0 ],
					"midpoints" : [ 339.5, 111.0, 339.5, 111.0 ],
					"source" : [ "obj-camera-msg", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-center-msg", 0 ],
					"midpoints" : [ 649.5, 78.0, 649.5, 78.0 ],
					"source" : [ "obj-center", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-node", 0 ],
					"midpoints" : [ 649.5, 186.0, 339.5, 186.0 ],
					"source" : [ "obj-center-msg", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"midpoints" : [ 154.5, 246.0, 154.5, 246.0 ],
					"source" : [ "obj-host", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-print", 0 ],
					"midpoints" : [ 520.5, 222.0, 546.0, 222.0, 546.0, 198.0, 559.5, 198.0 ],
					"source" : [ "obj-node", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-route-node", 0 ],
					"midpoints" : [ 339.5, 222.0, 339.5, 222.0 ],
					"source" : [ "obj-node", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 704.0, 411.0, 154.5, 411.0 ],
					"source" : [ "obj-osc-bbox", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 550.0, 351.0, 336.0, 351.0, 336.0, 678.0, 154.5, 678.0 ],
					"source" : [ "obj-osc-centered", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-udpsend", 0 ],
					"midpoints" : [ 391.5, 657.0, 154.5, 657.0 ],
					"source" : [ "obj-osc-count", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"midpoints" : [ 497.375, 387.0, 497.375, 387.0 ],
					"source" : [ "obj-route-landmarks", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"midpoints" : [ 534.375, 411.0, 659.5, 411.0 ],
					"source" : [ "obj-route-landmarks", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 571.375, 411.0, 859.5, 411.0 ],
					"source" : [ "obj-route-landmarks", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"midpoints" : [ 444.75, 264.0, 371.5, 264.0 ],
					"order" : 1,
					"source" : [ "obj-route-node", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"midpoints" : [ 339.5, 255.0, 339.5, 255.0 ],
					"source" : [ "obj-route-node", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 2 ],
					"midpoints" : [ 392.125, 264.0, 1118.5, 264.0 ],
					"order" : 0,
					"source" : [ "obj-route-node", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 2 ],
					"midpoints" : [ 444.75, 273.0, 1335.5, 273.0 ],
					"order" : 0,
					"source" : [ "obj-route-node", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-camera-menu", 0 ],
					"midpoints" : [ 655.25, 297.0, 315.0, 297.0, 315.0, 57.0, 339.5, 57.0 ],
					"source" : [ "obj-route-node", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-osc-bbox", 0 ],
					"midpoints" : [ 602.625, 300.0, 704.0, 300.0 ],
					"source" : [ "obj-route-node", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-osc-centered", 0 ],
					"midpoints" : [ 550.0, 255.0, 550.0, 255.0 ],
					"source" : [ "obj-route-node", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-osc-count", 0 ],
					"midpoints" : [ 392.125, 255.0, 391.5, 255.0 ],
					"order" : 1,
					"source" : [ "obj-route-node", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-route-landmarks", 0 ],
					"midpoints" : [ 497.375, 300.0, 510.0, 300.0, 510.0, 351.0, 497.375, 351.0 ],
					"source" : [ "obj-route-node", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-scan-msg", 0 ],
					"midpoints" : [ 469.5, 78.0, 469.5, 78.0 ],
					"source" : [ "obj-scan-btn", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-node", 0 ],
					"midpoints" : [ 469.5, 186.0, 339.5, 186.0 ],
					"source" : [ "obj-scan-msg", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-start-msg", 0 ],
					"midpoints" : [ 747.5, 123.0, 774.5, 123.0 ],
					"source" : [ "obj-sel-startstop", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-stop-msg", 0 ],
					"midpoints" : [ 729.5, 117.0, 729.5, 117.0 ],
					"source" : [ "obj-sel-startstop", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-node", 0 ],
					"midpoints" : [ 774.5, 186.0, 339.5, 186.0 ],
					"source" : [ "obj-start-msg", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-sel-startstop", 0 ],
					"midpoints" : [ 729.5, 78.0, 729.5, 78.0 ],
					"source" : [ "obj-startstop", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-node", 0 ],
					"midpoints" : [ 729.5, 186.0, 339.5, 186.0 ],
					"source" : [ "obj-stop-msg", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-type-menu", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-type-msg", 0 ],
					"source" : [ "obj-type-menu", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-node", 0 ],
					"midpoints" : [ 180.0, 186.0, 339.5, 186.0 ],
					"source" : [ "obj-type-msg", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-8" : [ "port", "port", 0 ],
			"obj-bodies" : [ "tracking-limit", "tracking-limit", 0 ],
			"obj-center" : [ "center", "center", 0 ],
			"obj-host" : [ "host", "host", 0 ],
			"obj-scan-btn" : [ "scan-cameras", "scan-cameras", 0 ],
			"obj-startstop" : [ "run", "run", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ],
					"buttons" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
